import Head from 'next/head'
import { useEffect, useState } from 'react'
import { TokenListProvider } from '@solana/spl-token-registry'
import { Connection, PublicKey, clusterApiUrl, LAMPORTS_PER_SOL } from '@solana/web3.js'

import TokenCard from '../components/TokenCard'

const clusterSlug = 'devnet' // devnet, mainnet-beta
const PROGRAM_ID = 'TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA'

function Home () {
  const [copyLabel, setCopyLabel] = useState('Copy')
  const [tokens, setTokens] = useState({})
  const [userInfo, setUserInfo] = useState({})
  const [myTokens, setMyTokens] = useState([])

  useEffect(() => {
    setTimeout(() => {
      const isTokenLoaded = Object.keys(tokens).length > 0

      if (!isTokenLoaded) {
        return false
      }

      const isPhantomInstalled = window.solana && window.solana.isPhantom
      if (!isPhantomInstalled) {
        return window.open('https://phantom.app/', '_blank')
      }

      window.solana.connect({ onlyIfTrusted: true }).then(async ({ publicKey }) => {
        init({ publicKey })
      })
    }, 100)
  }, [tokens])

  const init = async ({ publicKey }) => {
    const connection = new Connection(clusterApiUrl(clusterSlug), 'confirmed')
    const address = publicKey.toString()
    const pubKey = new PublicKey(address)
    const programId = new PublicKey(PROGRAM_ID)
    const getTokenAccountsByOwner = await connection.getParsedTokenAccountsByOwner(pubKey, { programId })
    const myBalance = await connection.getBalance(pubKey)
    const myBalanceString = `${new Intl.NumberFormat().format(myBalance / LAMPORTS_PER_SOL)} SOL`
    const splTokens = []

    for (const token of getTokenAccountsByOwner.value) {
      const { mint: tokenAddress, tokenAmount } = token.account.data.parsed.info
      splTokens.push({ tokenAddress, balance: tokenAmount.uiAmountString })
    }

    setMyTokens(splTokens)
    setUserInfo({ publicKey: pubKey.toString(), balance: myBalanceString })
  }

  useEffect(() => {
    new TokenListProvider().resolve().then(tokens => {
      const allToken = {}
      const tokenList = tokens.filterByClusterSlug(clusterSlug).getList()

      for (const token of tokenList) {
        allToken[token.address] = token
      }

      setTokens(allToken)
    })
  }, [])

  const handleConnect = async () => {
    const resp = await window.solana.connect()
    const publicKey = resp.publicKey.toString()

    init({ publicKey })
  }

  const handleLogout = () => {
    window.solana.disconnect()
    setUserInfo({})
    setMyTokens([])
  }

  const handleCopy = (address) => {
    setCopyLabel('Copies')

    setTimeout(() => {
      navigator.clipboard.writeText(address)
      setCopyLabel('Copy')
    }, 500)
  }

  return (
    <div className='flex flex-col justify-center min-h-screen py-2'>
      <Head>
        <title>Example Connect to Phantom Wallet</title>
        <link rel='icon' href='/favicon.ico' />
      </Head>

      <main className='flex flex-col items-center mt-8 w-full flex-1 px-20 text-center'>
        <h1 className='text-6xl font-bold'>
          Example Connect to Phantom Wallet
        </h1>

        <div className='mt-8'>
          {
            userInfo.publicKey
              ? <PrimaryButton onClick={handleLogout}>Disconnect</PrimaryButton>
              : <PrimaryButton onClick={handleConnect}>Connect to Phantom Wallet</PrimaryButton>
          }
        </div>

        {
          userInfo.publicKey && (
            <div className='mt-8'>
              <div className='box-border p-4 border-2 flex justify-start flex-col'>
                <div>
                  <span className='text-gray-400 text-sm'>Your Address is:</span>
                  <span className='text-blue-900 text-xs ml-1'>
                    {userInfo.publicKey}
                  </span>
                  <a className='ml-3 text-xs text-blue-500 cursor-pointer' onClick={handleCopy.bind(this, userInfo.publicKey)}>
                    {copyLabel}
                  </a>
                </div>
                <div className='self-start'>
                  <span className='text-gray-400 text-sm'>Balance:</span>
                  <span className='text-blue-900 text-md ml-1'>{userInfo.balance}</span>
                </div>
              </div>
            </div>
          )
        }
        <div className='mt-8'>
          {
            userInfo.publicKey &&
              <h1 className='text-6xl font-bold space-y-2 space-x-2'>
                Your tokens:
              </h1>
          }

          <div className='grid-cols-3 gap-y-1.5 gap-x-1 grid mt-3'>
            {
              myTokens.map(token => {
                return (
                  <TokenCard
                    balance={token.balance}
                    name={token?.token?.name}
                    symbol={token?.token?.symbol}
                    logoUri={token?.token?.logoUri}
                    key={token.tokenAddress.toString()}
                    address={token.tokenAddress.toString()}
                  />
                )
              })
            }
          </div>
        </div>

      </main>
    </div>
  )
}

const PrimaryButton = ({ children, onClick = () => {} }) => {
  return (
    <a
      onClick={onClick}
      className='w-full cursor-pointer flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 md:py-4 md:text-lg md:px-10'
    >
      {children}
    </a>
  )
}

export default Home
