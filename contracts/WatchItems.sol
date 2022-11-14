// contracts/WatchItems.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract WatchItems is ERC1155 {
    uint256 public constant BREITLING_COLT = 0;
    uint256 public constant BREITLING_NAVITIMER = 1;
    uint256 public constant ROLEX_DAYTONA = 2;
    uint256 public constant TAG_HEUER_CARRERA_CALIBRE_5 = 3;
    uint256 public constant IWC_PORTOFINO = 4;

    constructor() public ERC1155("") {
        _mint(msg.sender, BREITLING_COLT, 2, "");
        _mint(msg.sender, BREITLING_COLT, 15, "");
        _mint(msg.sender, ROLEX_DAYTONA, 1, "");
        _mint(msg.sender, TAG_HEUER_CARRERA_CALIBRE_5, 50, "");
        _mint(msg.sender, IWC_PORTOFINO, 5, "");
    }

}