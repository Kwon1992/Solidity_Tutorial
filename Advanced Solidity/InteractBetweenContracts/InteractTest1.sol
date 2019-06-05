pragma solidity 0.5.2;

contract InteractTest1 {
    
    uint16 test;
    
    function addOne() public returns (uint16){
        test += 1;
        return test;
    }
    
    function getTestVal() public view returns (uint16) {
        return test;
    }
}
