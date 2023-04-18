// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "../contracts/UniswapV2Pair.sol";

contract TestUniswapV2Pair {
    UniswapV2Pair pair;
    address tokenA = 0x1234567890123456789012345678901234567890;
    address tokenB = 0x0987654321098765432109876543210987654321;
    uint112 reserveA = 1000;
    uint112 reserveB = 2000;
    uint32 blockTimestampLast = 0;

    function beforeEach() public {
        pair = new UniswapV2Pair();
        pair.initialize(tokenA, tokenB);
        pair.mint(address(this));
    }

    function testInitialize() public view {
        assert(pair.token0() == tokenA);
        assert(pair.token1() == tokenB);
    }

    function testMint() public view {
        uint balance = pair.balanceOf(address(this));
        assert(balance == 100);
    }

    // function testSwap() public {
    //     pair.swap(0, 100, address(this), "");
    //     uint balanceA = pair.getReserves().reserve0;
    //     uint balanceB = pair.getReserves().reserve1;
    //     assert(balanceA == 900);
    //     assert(balanceB == 2100);
    // }

    function testBurn() public {
        pair.burn(address(this));
        uint balance = pair.balanceOf(address(this));
        assert(balance == 0);
    }

    // function testSync() public {
    //     pair.sync();
    //     uint112 newReserveA = pair.getReserves().reserve0;
    //     uint112 newReserveB = pair.getReserves().reserve1;
    //     assert(newReserveA == reserveA);
    //     assert(newReserveB == reserveB);
    // }

    function testGetReserves() public view {
        (
            uint112 _reserve0,
            uint112 _reserve1,
            uint32 _blockTimestampLast
        ) = pair.getReserves();
        assert(_reserve0 == reserveA);
        assert(_reserve1 == reserveB);
        assert(_blockTimestampLast == blockTimestampLast);
    }
}
