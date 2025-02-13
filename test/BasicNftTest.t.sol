// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant BERNARD = "ipfs.io/ipns/k51qzi5uqu5dl8t7yzh3j8eu1tolmtro9dd2v5sry5os340jka811yg4ibll1v";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    // Strings are more comlex types and act like dynamic arrays
    // To compare, convert strings to hash to compare values
    function testNameIsCorrect() public view {
        string memory expectedName = "Dogie";
        string memory actualName = basicNft.name();
        // assert(expectedName == actualName);
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft(BERNARD);
        assert(basicNft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(BERNARD)) == keccak256(abi.encodePacked(basicNft.tokenURI(0))));
    }
}
