// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.5.16;

import "../src/UniswapV2ERC20.sol";

contract ERC20 is UniswapV2ERC20 {
    constructor(uint _totalSupply) public {
        _mint(msg.sender, _totalSupply);
    }
}