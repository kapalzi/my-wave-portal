// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    struct Wave {
        address waver;
        string message;
        uint256 timestamp;
    }

    uint256 totalWaves;
    Wave[] waves;

    event NewWave(address indexed from, uint256 timestamp, string message);

    constructor() payable {
        console.log("Hello I am a smart contract");
    }

    function timeString(uint256 waves) internal pure returns (string memory) {
        string memory timeText = "time";
        if (waves > 1) {
            timeText = "times";
        }

        return timeText;
    }

    function wave(string memory _message) public {
        totalWaves += 1;
        console.log("%s has waved!", msg.sender);

        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, block.timestamp, _message);

        uint256 prizeAmount = 0.0001 ether;
        require(
            prizeAmount <= address(this).balance,
            "Trying to withdraw more money than the contract has."
        );
        (bool success, ) = (msg.sender).call{value: prizeAmount}("");
        require(success, "Failed to withdraw money from contract.");
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}
