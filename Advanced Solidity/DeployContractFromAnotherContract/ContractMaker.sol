pragma solidity 0.5.2;

contract ContractMaker {
    address owner;
    address[2] public contracts;
    uint testNum = 0;
    
    constructor() public { // constructor
        owner = msg.sender;
        A contractA = new A();
        B contractB = new B();
        contracts[0] = address(contractA);
        contracts[1] = address(contractB);
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    
    function callA() public onlyOwner returns (uint){
        testNum =  A(contracts[0]).test();
        return testNum;
    }
    
    function callB() public onlyOwner returns (uint){
        testNum = B(contracts[1]).test();
        return testNum;
    }
    
    function getTestNum() view public returns (uint){
        return testNum;
    }
    
    function getAddressA() view public returns (address) {
        return contracts[0];
    }
    
    function getAddressB() view public returns (address) {
        return contracts[0];
    }
    
    function resetTestNum() public {
        testNum = 0;
    }
}


contract A {
    function test() public returns (uint) {
        return 1;
    }
}


contract B {
    function test() public returns (uint) {
        return 2;
    }
}
