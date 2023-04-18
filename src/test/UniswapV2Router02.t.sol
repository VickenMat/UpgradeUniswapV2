// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// import "../contracts/UniswapV2Router02.sol";

// contract TestUniswapV2Router02 {
//     UniswapV2Router02 router;

//     address private tokenA = 0x123;
//     address private tokenB = 0x456;
//     address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // address of WETH on mainnet

//     address private owner = 0x789;

//     uint256 private deadline = block.timestamp + 120; // 2 minute deadline

//     uint256 private amountIn = 1000;
//     uint256 private amountOutMin = 900;

//     uint256 private ethValue = 1 ether; // 1 ETH

//     function beforeEach() public {
//         // Deploy UniswapV2Router02 contract
//         router = new UniswapV2Router02(address(0), address(0));

//         // Mint some WETH for testing
//         IWETH(weth).deposit{value: ethValue}();
//         assert(IWETH(weth).balanceOf(address(this)) == ethValue);

//         // Approve WETH for router
//         IWETH(weth).approve(address(router), ethValue);
//     }

//     function testSwapExactTokensForTokens() public {
//         // Transfer some tokens to this contract for testing
//         IERC20(tokenA).transferFrom(owner, address(this), amountIn);
//         assert(IERC20(tokenA).balanceOf(address(this)) == amountIn);

//         // Swap tokenA for tokenB
//         uint256[] memory amounts = router.swapExactTokensForTokens(
//             amountIn,
//             amountOutMin,
//             path,
//             address(this),
//             deadline
//         );

//         // Check output token amount
//         assert(amounts[amounts.length - 1] >= amountOutMin);
//     }

//     function testSwapExactETHForTokens() public payable {
//         // Swap ETH for tokenB
//         uint256[] memory amounts = router.swapExactETHForTokens{
//             value: ethValue
//         }(amountOutMin, path, address(this), deadline);

//         // Check output token amount
//         assert(amounts[amounts.length - 1] >= amountOutMin);
//     }

//     function testSwapExactTokensForETH() public {
//         // Transfer some tokens to this contract for testing
//         IERC20(tokenA).transferFrom(owner, address(this), amountIn);
//         assert(IERC20(tokenA).balanceOf(address(this)) == amountIn);

//         // Swap tokenA for ETH
//         uint256[] memory amounts = router.swapExactTokensForETH(
//             amountIn,
//             amountOutMin,
//             path,
//             address(this),
//             deadline
//         );

//         // Check output ETH amount
//         assert(amounts[amounts.length - 1] >= amountOutMin);

//         // Check WETH balance of this contract
//         assert(IWETH(weth).balanceOf(address(this)) >= ethValue);
//     }

//     function testSwapETHForExactTokens() public payable {
//         // Swap ETH for tokenA
//         uint256[] memory amounts = router.swapETHForExactTokens{
//             value: ethValue
//         }(amountIn, path, address(this), deadline);

//         // Check input ETH amount
//         assert(msg.value == amounts[0]);

//         // Check output token amount
//         assert(amounts[amounts.length - 1] == amountIn);

//         // Check WETH balance of this contract
//     }
// }
