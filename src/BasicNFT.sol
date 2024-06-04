// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.25;

import { ERC721 } from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNFT is ERC721{

    // Agregamos nuestro propio contador de token 
    uint256 private s_tokenCunter;
    mapping (uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("Cappy", "CAPYBARA") {
        s_tokenCunter = 0;
    }

    function mintNFT(string memory tokenUri) public {
        s_tokenIdToUri[s_tokenCunter] = tokenUri;
        _safeMint(msg.sender, s_tokenCunter);
        s_tokenCunter++;
    }

    function tokenURI(uint256 _tokenId) public view override returns (string memory){ // GET TOKEN URI
        return s_tokenIdToUri[_tokenId];
    }

}