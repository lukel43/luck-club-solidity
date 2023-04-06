// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

// TODO: Keep in mind concepts around "mutual aid societies"

contract SimpleStorage {
    // Define a struct to store bets correlated with the address of the bettor
    struct Bet{
        uint bet;
        address bettor;
    }

    // Define a dynamic array to store these bets
    Bet[] public bets;
    
    /// @dev Allows user to place a bet and stores it in the array with this address
    function setBet() public payable {
        require(msg.value >= 0.01 ether, "Insufficient funds");
        Bet memory newBet = Bet(msg.value, msg.sender);
        bets.push(newBet);
    }

    /// @dev Allows the user to get a specific bet from the array
    /// @param index The index of the bet being received
    /// @return bets[index] The struct of the bet at the specified index
    function getBet(uint index) public view returns (Bet memory) {
        return bets[index];
    }
}