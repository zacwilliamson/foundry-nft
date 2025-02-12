// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

// import {HelperConfig} from "./HelperConfig.s.sol";

contract MintBasicNft is Script {
    string public constant BERNARD =
        "ipfs.io/ipns/k51qzi5uqu5dl8t7yzh3j8eu1tolmtro9dd2v5sry5os340jka811yg4ibll1v";

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        BasicNft(contractAddress).mintNft(BERNARD);
        vm.stopBroadcast();
    }
}
