// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.25;

import { Test } from "forge-std/Test.sol";

import {BasicNFT} from "../../src/BasicNFT.sol";   

import { DeployBasicNFT } from "../../script/DeployBasicNFT.s.sol";

contract BasicNftTest is Test {

    DeployBasicNFT public deployer;
    BasicNFT public basicNft;
    address public USER = makeAddr("user");
    string public constant CAPY = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployBasicNFT();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Cappy";
        string memory actualName = basicNft.name();

        // * compare two strings
        // 1. transform to bytes32
        // 2. make hash
        // 3. compare 
        assert( keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)) );
    }
    
    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNFT(CAPY);
        assertEq(basicNft.balanceOf(USER), 1); // verificar que el balance sea de 1 (un mint token)
        assertEq(keccak256(abi.encodePacked(basicNft.tokenURI(0))), keccak256(abi.encodePacked(CAPY))); // verificar que el URI del token sea de CAPY
    }

}