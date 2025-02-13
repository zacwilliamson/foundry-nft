// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    uint256 private s_tokenCounter;
    string private s_sadSvg;
    string private s_happySvg;

    constructor(
        string memory sadSvg,
        string memory happySvg
    ) ERC721("Mood NFT", "MN") {
        s_tokenCounter = 0;
        s_sadSvg = sadSvg;
        s_happySvg = happySvg;
    }

    function mintNft(string memory tokenUri) public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    // this is the function that gets called to view any NFT
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {}
}
