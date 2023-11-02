### Why invest in PhaNtom

> **SUPER FAST TRANSACTIONS:** Instant payments and quick confirmation. Much faster than Bitcoin. Your payments will be processed anywhere in the world at any time, as quickly as possible. The speed of payment, which is the distinctive advantage of a PhantomX. All transactions are stored in a unit of cost and can be accessed by any user at any time.

> **SECURITY & ANONYMOUS:** With the built-in encryption of the wallet, you can safely store your PhantomX on your equipment. We are providing an online wallet soon as possible. Transactions are completely anonymous using darksend.

> **GROWING COMMUNITY:** PhantomX has a growing and friendly community. We have many plans and developments for the introduction of the coin into real life. We are open for cooperation and everyone can participate and contribute to the improvement of the dissemination PhantomX.

![phantom-1-2](https://github.com/Reymen0607/pann/assets/74971742/69ac6374-4864-4326-8791-abd0613b9907)


### Technical details

 **System Protocol:** Proof-of-Work and Proof-of-Stake<br>
 **Hash Algorithm:** X11<br>
 **Currency symbols:** PNX<br>
 **Market Cap:** 50 millions<br>
 **Block Time:** 120 seconds<br>
 **Masternode Collateral:** 20.000 PNX<br>
 **Masternode Rewards:** 50% from PoS<br>



 ### Auto install Script for Linux

 USE THIS SCRIPT ON FRESH SYSTEM INSTALL !

 Connect to your System using SSH & execute the following commands

     cd ~
     wget https://raw.githubusercontent.com/PhantomxTeam/autoinstallpnx/master/autoinstallpnx.sh
     sudo chmod +x autoinstallpnx.sh
     ./autoinstallpnx.sh

 Now the script will auto start to compile and to download the latest blockchain



 ### To run the wallet & other useful info:

 To run the wallet as daemon (once you execute this command you can close the terminal and the wallet will continue working)

     /wallets/phantomx/phantomxd  -datadir=/wallets/phantomx/wallet -daemon -start

 To stop the wallet (previous started)

     /wallets/phantomx/phantomxd  -datadir=/wallets/phantomx/wallet stop

 To get actual info from the running pnx wallet

     /wallets/phantomx/phantomxd  -datadir=/wallets/phantomx/wallet getinfo 



     ## Example use

AppModule.ts

```ts
import { NgModule } from "@angular/core";
import { BrowserModule } from "@angular/platform-browser";
import { AngularPhantomWalletLibModule } from "@vdscruz/angular-phantom-wallet-lib";

import { AppComponent } from "./app.component";

@NgModule({
  imports: [BrowserModule, AngularPhantomWalletLibModule.forRoot()],
  declarations: [AppComponent],
  bootstrap: [AppComponent],
})
export class AppModule {}
```

polyfills.ts

```ts
/***************************************************************************************************
 * APPLICATION IMPORTS
 */
(window as any)["global"] = window;
