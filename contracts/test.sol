// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

// TODO: Keep in mind concepts around "mutual aid societies"

contract SimpleStorage {
    uint betAmt;
    uint memberLimit = 100;
    // address[] members = new address[](memberLimit);
    mapping(address => uint) public members;

    function setBet(uint x) public {
        betAmt = x;
    }

    function getBet() public view returns (uint) {
        return betAmt;
    }

    function storeMembers(address _member, uint _bet) public{
        // TODO: Store contributor by address
        // TODO: Associate the wallet address with a given Tx <--- mapping?
        members[_member] = _bet;
    }
}