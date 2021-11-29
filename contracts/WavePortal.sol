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

    constructor() {
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
        waves.push(Wave(msg.sender, _message, block.timestamp));

        emit NewWave(msg.sender, block.timestamp, _message);
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
        return totalWaves;
    }
}
