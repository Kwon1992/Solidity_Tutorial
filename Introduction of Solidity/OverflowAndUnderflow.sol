pragma solidity ^0.4.24;

contract OverflowAndUnderflow {
    function overflow() public pure returns (uint256) {
        uint256 max = 2**256-1;
        return max + 1;
    }
    
    function underflow() public pure returns (uint256) {
        uint256 min = 0;
        return min - 1;
    }
}
