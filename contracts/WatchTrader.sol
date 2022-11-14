// contracts/WatchItems.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract WatchTrader{
    //Mapping to look up listing key-value pairs as well as account balances
    mapping(address => mapping(uint256 => Listing)) public listings;
    mapping(address => uint256) public balances;

    //Set the structure of a listing
    struct Listing{
        uint256 price;
        address seller;
    }

    //Add a listing of item that is for sale
    //Check if account owns the item they want to list
    //Check if contract approved (ERC1155 requirement)
    function addListing(uint256 price, address itemContractAddress, uint256 itemID) public{
        ERC1155 token = ERC1155(itemContractAddress);
        require(token.balanceOf(msg.sender, itemID) > 0, "Must own token to be able to list it.");
        require(token.isApprovedForAll(msg.sender, address(this)), "Contract must be approved.");

        listings[itemContractAddress][itemID] = Listing(price, msg.sender); 
    }

    //Purchase an item that is listed as for sale
    //Check if account sent enough money (amount to buy * unit value)
    //Increase balance of seller and transfers token to buyer (that called function)
    function purchase(address itemContractAddress, uint256 itemID, uint256 amount) public payable {
        ERC1155 token = ERC1155(itemContractAddress);
        Listing memory item = listings[itemContractAddress][itemID];

        require(msg.value >= item.price * amount, "Insufficient amount sent to seller.");
        balances[item.seller] += msg.value;
        token.safeTransferFrom(item.seller, msg.sender, itemID, amount, "Transfer");
    }

    //Withdraw amount recieved as part of a sale
    //Check if amount that the seller wants to withdraw is available on their balances
    //Transfers amount and deducts from balances
    function withdraw(uint256 amount, address payable destAddr)public{
        require(amount <= balances[msg.sender], "Insufficient funds.");

        destAddr.transfer(amount);
        balances[msg.sender] -= amount;
    }
}