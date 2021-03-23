// SPDX-License-Identifier: MIT

pragma solidity ^0.8.1;

import "./ERC20.sol";

contract AsymPool is ERC20 {
    address public creator;
    bool isInitialized = false;

    address public pool_token;
    address public buffer_token;

    uint private reserve0;
    uint private reserve1;

    uint private peg;

    constructor () {
        creator = msg.sender;
    }

    function initialize(address _pool_token, address _buffer_token) external {
        require(!isInitialized);
        require(msg.sender == creator);

        pool_token = _pool_token;
        buffer_token = _buffer_token;
        isInitialized = true;
    }

    function swap(uint pool_token_out, uint buffer_token_out, address to) public {
        uint pool_balance = IERC20(pool_token).balanceOf(address(this));
        uint token_balance = IERC20(buffer_token).balanceOf(address(this));
    }
}
