// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;

    mapping(address => uint256) addressesWaves;

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

    function wave() public {
        totalWaves += 1;
        addressesWaves[msg.sender] += 1;

        console.log(
            "%s has waved %s %s!",
            msg.sender,
            addressesWaves[msg.sender],
            timeString(addressesWaves[msg.sender])
        );
    }

    function getTotalWaves() public view returns (uint256) {
        console.log("We have %d total waves!", totalWaves);
    }
}
