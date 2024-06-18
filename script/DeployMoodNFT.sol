// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import "../src/MoodNFT.sol";

import { MoodNFT } from "../src/MoodNFT.sol";
import { Script } from "forge-std/Script.sol";

contract DeployMoodNFT is Script {

    function run() external returns (MoodNFT) {
        vm.startBroadcast();
        MoodNFT moodNft = new MoodNFT("data:image/svg+xml;base64," + Base64.encode(s_sadSvgImageUri), "data:image/svg+xml;base64," + Base64.encode(s_happySvgImageUri));
        vm.stopBroadcast();
        return moodNft;
    }
}