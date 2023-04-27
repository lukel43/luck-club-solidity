// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract Club{
    // Define a struct to store bets correlated with the address of the bettor
    struct Bet {
        uint bet;
        address bettor;
    }

    // Define a dynamic array to store these bets
    Bet[] public bets;

    // Store the address of the contract creator
    address public owner;

    // Store the timestamp of when the betting period starts and ends
    uint public startTime;
    uint public endTime;

    // Store the winner of the bet
    address public winner;

    // Define an event to emit when a winner is selected
    event WinnerSelected(address winner, uint prize);

    // Initialize the contract with the timestamp for the end of the betting period
    constructor() payable {
        startTime = block.timestamp;
        endTime = startTime + 5 minutes;
        owner = msg.sender;
        Bet memory newBet = Bet(msg.value, msg.sender);
        bets.push(newBet);
    }

    // Allows users to place a bet and stores it in the array with their address
    function setBet() public payable {
        require(block.timestamp < endTime, "Betting period has ended");
        require(msg.value > 0, "Insufficient funds");
        Bet memory newBet = Bet(msg.value, msg.sender);
        bets.push(newBet);
    }

    // Returns a random number between 0 and the length of the bets array
    function _random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, bets.length)));
    }

    // Selects a winner and transfers the prize to them
    function selectWinner() public returns(address){
        require(block.timestamp >= endTime, "Betting period has not ended yet");
        require(bets.length > 0, "No bets have been placed");
        uint index = _random() % bets.length;
        winner = bets[index].bettor;
        uint prize = address(this).balance;
        emit WinnerSelected(winner, prize);
        payable(winner).transfer(prize);
        return winner;
    }

    // Add a viewable for pool particpants to verify?
    function viewPool() public view returns (Bet[] memory){
        return bets;
    }

    // viewWinner function?\
    function viewWinner() public view returns (address){
        return winner;
    }
}