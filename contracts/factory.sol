// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

import './club.sol';

// TODO: Make data structure to hold child contracts?

contract Factory{

    address[] public clubs;
    event CreatedClub(address club);

    function makeClub() public {
        Club club = new Club();
        emit CreatedClub(address(club));
        clubs.push(address(club));
    }

    // TODO: View function for factory'd contracts

}