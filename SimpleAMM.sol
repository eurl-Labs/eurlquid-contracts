// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "@openzeppelin/contracts/interfaces/IERC20.sol";

/**
 * @title SimpleAMM
 * @dev A very simple Automated Market Maker (AMM) contract without LP Tokens.
 * Aligned with the MultiPoolAMM documentation.
 *
 * !!! ATTENTION: This contract is for preview and educational purposes only. !!!
 */
contract SimpleAMM {
    // --- State Variables ---

    struct Pool {
        address tokenA;
        address tokenB;
        uint256 reserveA;
        uint256 reserveB;
    }

    // Mapping from poolId to Pool data
    mapping(bytes32 => Pool) public pools;
    uint256 private _poolCount;

    // Fee for each swap (0.3%)
    uint256 public constant SWAP_FEE = 30; 
    uint256 public constant FEE_DENOMINATOR = 10000;

    // --- Events ---
    event PoolCreated(bytes32 indexed poolId, address indexed tokenA, address indexed tokenB);
    event LiquidityAdded(bytes32 indexed poolId, uint256 amountA, uint256 amountB);
    event LiquidityRemoved(bytes32 indexed poolId, uint256 amountA, uint256 amountB);
    event Swapped(bytes32 indexed poolId, address indexed user, address tokenIn, address tokenOut, uint256 amountIn, uint256 amountOut);


    // --- Write Functions ---

    /**
     * @notice Creates a new liquidity pool for a pair of tokens.
     * @param tokenA The address of the first token contract.
     * @param tokenB The address of the second token contract.
     * @return poolId The unique ID for the newly created pool.
     */
    function createPool(address tokenA, address tokenB) external returns (bytes32 poolId) {
        require(tokenA != address(0) && tokenB != address(0), "SimpleAMM: Zero address");
        require(tokenA != tokenB, "SimpleAMM: Identical tokens");

        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        
        poolId = getPoolId(token0, token1);
        require(pools[poolId].tokenA == address(0), "SimpleAMM: Pool already exists");

        pools[poolId] = Pool({
            tokenA: token0,
            tokenB: token1,
            reserveA: 0,
            reserveB: 0
        });

        _poolCount++;

        emit PoolCreated(poolId, token0, token1);
    }

    /**
     * @notice Adds liquidity to a pool.
     * @param poolId The ID of the pool.
     * @param amountA The amount of token A to add.
     * @param amountB The amount of token B to add.
     */
    function addLiquidity(bytes32 poolId, uint256 amountA, uint256 amountB) external {
        Pool storage pool = pools[poolId];
        require(pool.tokenA != address(0), "SimpleAMM: Pool does not exist");

        IERC20(pool.tokenA).transferFrom(msg.sender, address(this), amountA);
        IERC20(pool.tokenB).transferFrom(msg.sender, address(this), amountB);

        pool.reserveA += amountA;
        pool.reserveB += amountB;

        emit LiquidityAdded(poolId, amountA, amountB);
    }

    /**
     * @notice Removes liquidity from a pool.
     * @param poolId The ID of the pool.
     * @param amountA The amount of token A to withdraw.
     * @param amountB The amount of token B to withdraw.
     */
    function removeLiquidity(bytes32 poolId, uint256 amountA, uint256 amountB) external {
        Pool storage pool = pools[poolId];
        require(pool.tokenA != address(0), "SimpleAMM: Pool does not exist");
        require(pool.reserveA >= amountA && pool.reserveB >= amountB, "SimpleAMM: Insufficient reserves");

        pool.reserveA -= amountA;
        pool.reserveB -= amountB;

        IERC20(pool.tokenA).transfer(msg.sender, amountA);
        IERC20(pool.tokenB).transfer(msg.sender, amountB);

        emit LiquidityRemoved(poolId, amountA, amountB);
    }

    /**
     * @notice Swaps one token for another.
     * @param poolId The ID of the pool.
     * @param tokenIn The address of the token being sent by the user.
     * @param amountIn The amount of the token being sent.
     * @param amountOutMin The minimum amount of output token expected (for slippage protection).
     * @return amountOut The amount of output token received.
     */
    function swap(bytes32 poolId, address tokenIn, uint256 amountIn, uint256 amountOutMin) external returns (uint256 amountOut) {
        Pool storage pool = pools[poolId];
        require(pool.tokenA != address(0), "SimpleAMM: Pool does not exist");
        require(tokenIn == pool.tokenA || tokenIn == pool.tokenB, "SimpleAMM: Invalid token");
        require(amountIn > 0, "SimpleAMM: Zero amount in");

        IERC20(tokenIn).transferFrom(msg.sender, address(this), amountIn);

        (uint256 reserveIn, uint256 reserveOut, address tokenOut) = 
            tokenIn == pool.tokenA ? (pool.reserveA, pool.reserveB, pool.tokenB) : (pool.reserveB, pool.reserveA, pool.tokenA);

        uint256 amountInWithFee = amountIn * (FEE_DENOMINATOR - SWAP_FEE);
        amountOut = (amountInWithFee * reserveOut) / (reserveIn * FEE_DENOMINATOR + amountInWithFee);

        require(amountOut >= amountOutMin, "SimpleAMM: Slippage too high");

        if (tokenIn == pool.tokenA) {
            pool.reserveA += amountIn;
            pool.reserveB -= amountOut;
        } else {
            pool.reserveB += amountIn;
            pool.reserveA -= amountOut;
        }
        
        IERC20(tokenOut).transfer(msg.sender, amountOut);

        emit Swapped(poolId, msg.sender, tokenIn, tokenOut, amountIn, amountOut);
    }


    // --- Read Functions ---

    /**
     * @notice Calculates the pool ID from two token addresses.
     */
    function getPoolId(address tokenA, address tokenB) public pure returns (bytes32) {
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
        return keccak256(abi.encodePacked(token0, token1));
    }

    /**
     * @notice Gets the reserve data from a pool.
     */
    function getReserves(bytes32 poolId) external view returns (uint256 reserveA, uint256 reserveB) {
        Pool storage pool = pools[poolId];
        require(pool.tokenA != address(0), "SimpleAMM: Pool does not exist");
        return (pool.reserveA, pool.reserveB);
    }

    /**
     * @notice Gets the estimated amount of output token from a swap.
     */
    function getQuote(bytes32 poolId, address tokenIn, uint256 amountIn) external view returns (uint256 amountOut) {
        Pool storage pool = pools[poolId];
        require(pool.tokenA != address(0), "SimpleAMM: Pool does not exist");
        require(amountIn > 0, "SimpleAMM: Zero amount in");

        (uint256 reserveIn, uint256 reserveOut) = 
            tokenIn == pool.tokenA ? (pool.reserveA, pool.reserveB) : (pool.reserveB, pool.reserveA);
        
        uint256 amountInWithFee = amountIn * (FEE_DENOMINATOR - SWAP_FEE);
        amountOut = (amountInWithFee * reserveOut) / (reserveIn * FEE_DENOMINATOR + amountInWithFee);
    }

    /**
     * @notice Gets the total number of pools created.
     */
    function getPoolCount() external view returns (uint256) {
        return _poolCount;
    }
}
