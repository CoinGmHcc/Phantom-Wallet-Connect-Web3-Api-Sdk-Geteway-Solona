import { useState } from 'react'

function TokenCard ({ logoUri, name, symbol, balance = 0, address }) {
  const [copyLabel, setCopyLabel] = useState('Copy')
  const balanceLabel = new Intl.NumberFormat().format(balance)
  const shortAddress = `${address.slice(0, 5)}...${address.slice(-5)}`

  const handleCopy = () => {
    setCopyLabel('Copies')

    setTimeout(() => {
      navigator.clipboard.writeText(address)
      setCopyLabel('Copy')
    }, 500)
  }

  return (
    <div className='box-border p-4 border-2 flex justify-start flex-row'>
      <div className='flex items-center'>
        {
        logoUri
          ? <img src={logoUri} width={64} style={{ borderRadius: '50%' }} />
          : (
            <div style={{ width: 64, height: 64, background: '#000000', display: 'flex', justifyContent: 'center', borderRadius: '50%' }}>
              <svg width='11' viewBox='0 0 11 18' fill='none' xmlns='http://www.w3.org/2000/svg'>
                <path d='M4.17285 12.2969H6.77441V12.0938C6.79004 10.4375 7.3291 9.67969 8.60254 8.89844C10.04 8.03906 10.9385 6.86719 10.9385 5.07812C10.9385 2.4375 8.88379 0.78125 5.89941 0.78125C3.16504 0.78125 0.946289 2.29688 0.868164 5.26563H3.64941C3.71973 3.79688 4.78223 3.09375 5.88379 3.09375C7.0791 3.09375 8.04004 3.89062 8.04004 5.11719C8.04004 6.21094 7.31348 6.96094 6.36816 7.55469C4.98535 8.41406 4.18848 9.28125 4.17285 12.0938V12.2969ZM5.54004 17.1719C6.46191 17.1719 7.25098 16.4062 7.25879 15.4531C7.25098 14.5156 6.46191 13.75 5.54004 13.75C4.58691 13.75 3.81348 14.5156 3.82129 15.4531C3.81348 16.4062 4.58691 17.1719 5.54004 17.1719Z' fill='#CCCCBC' />
              </svg>
            </div>
            )
        }
      </div>

      <div className='ml-3 text-left justify-center'>
        <div className='font-bold'>{name || 'Unknow'}</div>
        <div>{balanceLabel} {symbol || 'Tokens'}</div>

        <div>
          <span className='text-xs text-blue-900'>
            {shortAddress}
          </span>

          <a onClick={handleCopy} className='ml-3 text-xs text-blue-500 cursor-pointer'>
            {copyLabel}
          </a>
        </div>
      </div>
    </div>
  )
}

export default TokenCard
