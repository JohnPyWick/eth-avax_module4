## ERC20 token and deploy it on the Avalanche network

## Description
Creating a ERC20 token and deploying it on the Avalanche network for Degen Gaming. The smart contract have the following functionality:

Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
Transferring tokens: Players should be able to transfer their tokens to others.
Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
Checking token balance: Players should be able to check their token balance at any time.
Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.
## Steps to run this project

1. Clone the starter project template in your pc.

2. Create functions in your smart contract to mint,burn,redeem and transfer tokens.

3. Configure the hardhat.config file to enable the fork on the Avalanche network.

4. In terminal and run following command

This deploys the contract on Fuji network.

```
npx hardhat run --network fuji scripts/deploy.js

```

5. Verification
Verify One additional step is to verify the deployed smart contract. To do this, we need an API Key from Snowtrace. You will need to provide an email address to complete this step, but it is straightforward. 

Once your account is set up, you can go to your API Keys section and create a key from there.

Once you have your new API key, we can paste it into our Hardhat config file like so (outside of the network config):

```javascript
module.exports = {
  // ...rest of the config...
  etherscan: {
    apiKey: "YOUR API KEY",
  },
};
```
6. Now we have access to the verify task, which allows us to verify smart contracts on specific networks.


```bash
$ npx hardhat verify <contract address> <arguments> --network <network>
Scripts
```

7. Connect your metamask with the account in which you have some AVAX.
Also make sure to switch networks to Avalanche C-Chain.

8. In remix interact with the contract by deploying it through loading it from same address on which contract is created.


### A simple string array to store the redeemable items list and display it to the user.

```javascript
  string [3] public RedeemItems = ['1.Rengoku Sword', '2.Book of Flame Breathing', '3.Sword Hilt'];
```

### Burn Function

Burn tokens: Anyone can burn tokens that they own and are no longer needed.

```javascript
    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient Degen Tokens");
        _burn(msg.sender, amount);
    }

```
### Transfer Tokens Function


```javascript
    function transferTokens(address to, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient Degen Tokens");
        _transfer(msg.sender, to, amount);
    }
```
### Redeem Tokens function, intrinsically it uses burn to burn the tokens after redeem.

```javascript
 function redeemTokensForItem(uint256 itemno) external {
        uint256 redeemAmount; // The amount of tokens needed for redemption (adjust as needed)


       if(itemno == 1){
           redeemAmount = 200;
       }
       else if(itemno == 2) {
           redeemAmount = 100;
       }
       else if(itemno == 3) {
           redeemAmount = 50;
       }
       else{
           revert("Incorrect item number, only 3 items exist");
       }

        require(balanceOf(msg.sender) >= redeemAmount, "Insufficient Degen Tokens for redemption");
        
        

        // Burn the tokens used for redemption
        _burn(msg.sender, redeemAmount);
    }
```

## Authors

- [@JohnPyWick](https://github.com/JohnPyWick)


## License

This project is licensed under the MIT License - see the LICENSE.md file for details


