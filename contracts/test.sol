// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract SimpleStorage {
    uint betAmt;
    uint memberLimit = 100;
    address[] members = new address[](memberLimit);


    function setBet(uint x) public {
        betAmt = x;
    }

    function getBet() public view returns (uint) {
        return betAmt;
    }

    function storeMembers(address member) public{
        members.push() = member;
    }
}