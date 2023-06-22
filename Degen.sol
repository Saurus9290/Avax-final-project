// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.9.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.9.2/access/Ownable.sol";

contract Degen is ERC20, ERC20Burnable, Ownable {
    struct storeItems {
        string name;
        uint256 price;
        address owner;
    }
    mapping(string => storeItems) public items;

    constructor() ERC20("Degen", "DGN") {}

    function createStoreItems(string memory _name, uint256 _price)
        external
        onlyOwner
    {
        require(items[_name].price == 0, "Item already exists");
        storeItems memory store;
        store.name = _name;
        store.price = _price;
        store.owner = msg.sender;
        items[_name] = store;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address _to, uint256 amount) external {
        require(
            balanceOf(msg.sender) >= amount,
            "You do not have enough degen token"
        );
        transfer(_to, amount);
    }

    function burnTokens(uint256 amount) external {
        require(
            balanceOf(msg.sender) >= amount,
            "You do not have enough degen token"
        );
        _burn(msg.sender, amount);
    }

    function redeemToken(string memory name) external {
        require(balanceOf(msg.sender) != 0, "You dont have enough tokens");
        require(
            balanceOf(msg.sender) >= items[name].price,
            "You dont have enough degen tokens"
        );
        require(items[name].owner != msg.sender, "You already have this token");
        transfer(address(this), items[name].price);
        items[name].owner = msg.sender;
    }
}
