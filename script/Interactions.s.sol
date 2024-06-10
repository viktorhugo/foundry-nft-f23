// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.25;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import { Script } from "forge-std/Script.sol";
import { DevOpsTools } from "foundry-devops/src/DevOpsTools.sol";
import { BasicNFT } from "../src/BasicNFT.sol";


contract MintBasicNft is Script{

    string public constant CAPY_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        // simpre queremos trabajar con en NFT  mas reciente implementado
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("BasicNFT", block.chainid);

        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNFT(contractAddress).mintNFT(CAPY_URI);
        vm.stopBroadcast();
    }

}