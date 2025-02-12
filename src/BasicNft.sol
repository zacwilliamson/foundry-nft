// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// NFT Contract represents the "collection" of the NFT being created
// Each generated item in the collection has a unique token id
contract BasicNft is ERC721 {
    uint256 private s_tokenCounter;

    constructor() ERC721("Dogie", "DOG") {
        s_tokenCounter = 0;
    }

    function mintNft() public {}

    // this is the function that gets called to view any NFT
    function tokenURI(
        uint256 tokenId
    ) public view override returns (string memory) {
        return "";
    }
}
