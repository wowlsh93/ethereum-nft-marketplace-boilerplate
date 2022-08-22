// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
//Deployed address (Rinkeby):  0xe269943FEAb77661453773aa00c1ee65ec31e76e
contract NFT is ERC721 {
    using Counters for Counters.Counter;
    Counters.Counter private currentTokenId;

    constructor() ERC721("DANKOOK", "DAK") {}

    mapping(uint => string) tokenURIs;

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return tokenURIs[tokenId];
    }

    function mintTo(address to, string memory tokenURI) public returns (uint256)
    {
        currentTokenId.increment();
        uint256 newItemId = currentTokenId.current();
        _mint(to, newItemId);
        tokenURIs[newItemId] = tokenURI;
        return newItemId;
    }
}