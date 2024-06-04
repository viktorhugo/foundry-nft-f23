// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.25;

import { Script } from "forge-std/Script.sol";
import { BasicNFT } from "../src/BasicNFT.sol";

contract DeployBasicNFT is Script{

    function run() external returns (BasicNFT) {
        vm.startBroadcast();
        BasicNFT basictNft = new BasicNFT();
        vm.stopBroadcast();
        return basictNft;
    }

}   