// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import "../src/MoodNFT.sol";

import { MoodNFT } from "../src/MoodNFT.sol";
import { Script } from "forge-std/Script.sol";
// import { Base64 } from "forge-std/Base64.sol";

contract DeployMoodNFT is Script {

    function run() external returns (MoodNFT) {}

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        // example
        //  <svg viewBox="0 0 200 200" width="400"  height="400" x....>
        //  data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgIGhlaW...
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );

        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}