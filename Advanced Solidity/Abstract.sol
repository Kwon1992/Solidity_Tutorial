pragma solidity  ^0.4.24;

contract Animal { //abstract contract 
    string public breed;
    uint public age;
    uint public weight;
    
    constructor() public {
        age = 1;
        weight = 1;
    }
    
    function sleep() pure public returns (string memory) {return "Zzzz...";}
    function eat() pure public returns (string memory) {return "Nom nom...";}
    function talk() pure public returns (string memory);
}

contract Cat is Animal {
    constructor() {
        breed = "Persian";
        age = 3;
        weight = 5;
    }
    
    function talk() pure public returns (string memory) {return "Miaow";}
}

contract Dog is Animal {
    constructor() {
        breed = "Labrador";
        age = 5;
        weight = 3;
    }
    
    function talk() pure public returns (string memory) {return "Bark bark";}
}


interface Token {
    function transfer(address recipient, uint amount) external;
    function balanceOf(address _owner) external view returns(uint256);
}
