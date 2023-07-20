// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DegenToken is ERC20, Ownable {

    constructor() ERC20("Rengoku", "REN") {}

    string [3] public RedeemItems = ['1.Rengoku Sword', '2.Book of Flame Breathing', '3.Sword Hilt'];

    // Minting new tokens: Only the owner can mint tokens.
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Transfer tokens: Players can transfer their tokens to others.
    function transferTokens(address to, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient Degen Tokens");
        _transfer(msg.sender, to, amount);
    }

    // Burn tokens: Anyone can burn tokens that they own and are no longer needed.
    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient Degen Tokens");
        _burn(msg.sender, amount);
    }

    // Redeem tokens for items
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

    function RedeemableItems() public view returns (string[3] memory) {
        return RedeemItems;
    }
}
