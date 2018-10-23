# DISISME - A decentralized person profile platform

Disisme is a decentralized application that I have been working on in order to become more acquinted with everything that goes into the development of smart contracts. It enables ETH address users (Rinkeby for now, via MetaMask) to create a profile, add social network information, and add friends (that have permission to see your email address and in the future more information).

## How to run

Pull the files to your local computer, navigate to the folder, and run the run.js file in node via the command line.
```node run.js```
This will run the application at localhost:8000 which you can visit using the Chrome browser.

In order to use the functionality of the dApp, you need to have MetaMask activated (with an account on Rinkeby and some faucet ETH), which you can request here: https://faucet.rinkeby.io/

Optionally, you can choose to run the dApp on a private blockchain such as gananache. In that case you need to initiate a ganache-cli from the command line after having installed it, and deploy the smart contract (disisme.sol) to the ganache blockchain using Remix. Then, you need to change the SC address in the JS code for all view files so that it can connect to the smart contract. The ABI is the same and does not have to change.

### Assuming you are using MetaMask, the following functionality is enabled:

1) Create a profile by navigating to /create/. You can fill in all your data (for now there is no email verification process) and submit it. It will take a just a bit before the profile is live but you will already by redirected to the profile page (initially filled with placeholder data).
2) Add social network data by navigating to /social/ and filling in the form.
3) Adding and removing friends, enabling/disabling permissions such as viewing your email address (more functionality will be added for friends).

Keep in mind, this is my first ever dApp build in a couple of days (say +/- 15 hours). It's buggy, slim build, and not great looking. It is just to get better and show off some of the skills I have picked up thusfar.

All the best!