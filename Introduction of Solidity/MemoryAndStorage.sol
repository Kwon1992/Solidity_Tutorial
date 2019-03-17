pragma solidity ^0.4.24;

contract ChangeArrayValue {
    uint[20] public arr;
    
    function startChange() public {
        firstChange(arr);
        secondChange(arr);
        
        // answer is 4.
    }
    
    function firstChange(uint[20] storage x) internal { // use keyword 'storage'
        x[0] = 4;
    }
    
    function secondChange(uint[20] x) internal pure {
        x[0] = 3;
        // copy of the given variable. so no
    }
}
