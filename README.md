# ERC-20-Token

# MyToken (MTK)

## Overview
MyToken is a simple ERC-20 compatible token built on Ethereum for learning purposes.

## Token Details
- **Name**: MyToken
- **Symbol**: MTK
- **Decimals**: 18
- **Total Supply**: 1,000,000 MTK

## Features
- ✅ Standard ERC-20 implementation
- ✅ Transfer tokens between addresses
- ✅ Approve and transferFrom functionality
- ✅ Event emission for transparency
- ✅ Balance tracking

## How to Deploy
1. Open RemixIDE: https://remix.ethereum.org  
2. Create a new file named `MyToken.sol`  
3. Paste the smart contract code  
4. Compile using Solidity 0.8.x  
5. Deploy the contract with your chosen total supply  

## How to Use

### Check Balance
```solidity
balanceOf(address) → returns uint256
```

### Transfer Tokens
```solidity
transfer(address to, uint256 amount) → returns bool
```

### Approve Spending
```solidity
approve(address spender, uint256 amount) → returns bool
```

### Transfer on Behalf
```solidity
transferFrom(address from, address to, uint256 amount) → returns bool
```


## Learning Outcomes

- How to write and deploy a smart contract in Solidity

- The core components of the ERC-20 token standard

- How balance tracking, allowances, and transfers work internally

- Using Remix IDE to compile, deploy, and test contracts

- The importance of validation checks and event emission

- How token decimals and total supply are represented on Ethereum

This project gave me a clear foundation in smart contract development and practical blockchain concepts.
