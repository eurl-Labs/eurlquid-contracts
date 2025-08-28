// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.4.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

//  NOTE: THIS IS FOR PREVIEW ONLY
contract TUSDC is ERC20 {
    constructor(address initialOwner)
        ERC20("TUSDC", "tUSDC")
    {
        _mint(initialOwner, 100000000000000000000000000); // 100000000 TUSDC
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}
