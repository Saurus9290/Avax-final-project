# Project Title

Degen Token

## Description

Degen Token (DGN) is an ERC-20 compliant token built on the Ethereum blockchain. It includes additional features such as burning tokens, transferring tokens, and a token redemption system.


## Prerequisites
Solidity version 0.8.9 or later.
OpenZeppelin Contracts version 4.9.2.

## Usage
Compile and deploy the Degen contract to the Ethereum network.

As the contract owner, create store items by calling the createStoreItems function. Provide the name and price for each item. Make sure the item does not already exist.

Mint Degen tokens by calling the mint function as the contract owner. Specify the address to receive the newly minted tokens and the amount.

Users can transfer their Degen tokens to other addresses using the transferTokens function. Specify the recipient's address and the amount to transfer.

Users can burn their Degen tokens using the burnTokens function. Specify the amount to burn. This action permanently removes tokens from the total supply.

To redeem a store item, call the redeemToken function. Provide the name of the item to redeem. The function checks if the user has a sufficient token balance and transfers the required tokens to the contract. The ownership of the store item is then transferred to the user.


## Authors

@Saurus9290




## License

The Degen Token (DGN) contract is licensed under the MIT License
