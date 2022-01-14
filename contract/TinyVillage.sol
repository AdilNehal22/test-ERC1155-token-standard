// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.11;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";

contract TinyVillage is ERC1155 {

    uint256 public constant VILLAGE = 0;
    uint256 public constant MINE = 1;
    uint256 public constant FARM = 2;
    uint256 public constant MILL = 3;
    uint256 public constant CASTLE = 4;

    //The parament in ERC1155 is a URI that can include the string {id} which clients must replace
    //with the actual token ID.

    constructor() ERC1155("https://gateway.pinata.cloud/ipfs/QmTN32qBKYqnyvatqfnU8ra6cYUGNxpYziSddCatEmopLR/metadata/api/item/{id}.json") {

    }

    function mintVillage() public {
        require(balanceOf(msg.sender, VILLAGE) == 0, 'you already have');
        _mint(msg.sender,VILLAGE,1,"0x000");
    }

    function mintMine() public {
        require(balanceOf(msg.sender, VILLAGE) > 0, 'get a village');
        require(balanceOf(msg.sender, MINE) == 0, 'you already have a mine');
        _mint(msg.sender, MINE, 1, '0x000');
    }

    function mintFarm() public {
        require(balanceOf(msg.sender, VILLAGE) > 0, 'you need to have a village');
        require(balanceOf(msg.sender, FARM) == 0, 'you already have a farm');
        _mint(msg.sender, FARM, 1,'0x000');
    }

    function mintMill() public {
        require(balanceOf(msg.sender, VILLAGE) > 0, 'you need to have a village');
        require(balanceOf(msg.sender, FARM) > 0, 'you need to have farm');
        require(balanceOf(msg.sender, MILL) == 0, 'you already have a Mill');
        _mint(msg.sender, MILL, 1, '0x00');
    }

    function mintCastle() public{
        require(balanceOf(msg.sender,MINE) > 0,"you need have a Mine");
        require(balanceOf(msg.sender,MILL) > 0,"you need have a Mill");
        require(balanceOf(msg.sender,CASTLE) == 0,"you already have a Castle");
        _mint(msg.sender,CASTLE,1,"0x000");
    }

    
}