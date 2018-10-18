# Startup Builder

### Super simple decentralized application with a lot of bugs

Do not take this repo to seriously. This is the first dApp that I have made with close to 0 knowledge on smart contract programming at this point.

## Intro

In essence, I have created a web application that leverages express.js. This web application connects to an ethereum blockchain (such as ganache-cli) using its web3.js framework. Using remix I have deployed the smart contract "Startup" to the ganache local blockchain after running the ganache-cli locally. This contract can be found in the smart_contracts/contracts folder. Still need to figure out how to use truffle to compile and deploy from within node.js.

### Basic functionality

When initiating the contract, a ceo will be appointed using the msg.sender address. The CEO has the capability to appoint a CFO, COO, and change the startup idea. This means that the account/address sending the requests from the browser has to be the CEO address (or contract creator). As of now, one can only swap this address using metamask. Also, there is an invest function through which anybody can inject money into the company. Due this being the first contract, I have used if/else statement to verify msg.sender address matching the ceo's but this should obviously me done using a function modifier with require functionality.