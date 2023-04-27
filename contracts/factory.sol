// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

import './club.sol';

// Make data structure to hold child contracts?

contract Factory{

    address[] public clubs;
    event CreatedClub(address club);

    function makeClub() public {
        Club club = new Club();
        emit CreatedClub(address(club));
        clubs.push(address(club));
    }

    function viewClubs() public view returns (address[] memory){
        return clubs;
    }
}