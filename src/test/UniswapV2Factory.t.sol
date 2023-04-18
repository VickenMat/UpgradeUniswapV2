// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "../contracts/UniswapV2Factory.sol";

contract TestUniswapV2Factory {
    address private constant ADDRESS_ZERO = address(0);
    address private constant ADDRESS_ONE = address(1);
    address private constant ADDRESS_TWO = address(2);
    address private constant ADDRESS_THREE = address(3);
    address private constant ADDRESS_FOUR = address(4);

    UniswapV2Factory private factory;

    function beforeEach() public {
        factory = new UniswapV2Factory(ADDRESS_ONE);
    }

    function testAllPairsLength() public {
        uint length = factory.allPairsLength();
        require(
            length == 0,
            "TestUniswapV2Factory: allPairsLength() returned invalid length"
        );
    }

    function testCreatePair() public {
        address pair = factory.createPair(ADDRESS_TWO, ADDRESS_THREE);
        require(
            pair != ADDRESS_ZERO,
            "TestUniswapV2Factory: createPair() failed to create pair"
        );
        require(
            factory.getPair(ADDRESS_TWO, ADDRESS_THREE) == pair,
            "TestUniswapV2Factory: createPair() failed to set pair address in mapping"
        );
        require(
            factory.getPair(ADDRESS_THREE, ADDRESS_TWO) == pair,
            "TestUniswapV2Factory: createPair() failed to set pair address in reverse mapping"
        );
        require(
            factory.allPairsLength() == 1,
            "TestUniswapV2Factory: createPair() failed to add pair to allPairs"
        );
    }

    function testCreatePairWithExistingPair() public {
        address pair1 = factory.createPair(ADDRESS_TWO, ADDRESS_THREE);
        require(
            pair1 != ADDRESS_ZERO,
            "TestUniswapV2Factory: createPair() failed to create pair"
        );
        address pair2 = factory.createPair(ADDRESS_TWO, ADDRESS_THREE);
        require(
            pair2 == ADDRESS_ZERO,
            "TestUniswapV2Factory: createPair() created pair when one already exists"
        );
    }

    function testSetFeeTo() public {
        factory.setFeeTo(ADDRESS_FOUR);
        require(
            factory.feeTo() == ADDRESS_FOUR,
            "TestUniswapV2Factory: setFeeTo() failed to set feeTo address"
        );
    }

    function testSetFeeToSetter() public {
        factory.setFeeToSetter(ADDRESS_FOUR);
        require(
            factory.feeToSetter() == ADDRESS_FOUR,
            "TestUniswapV2Factory: setFeeToSetter() failed to set feeToSetter address"
        );
    }
}
