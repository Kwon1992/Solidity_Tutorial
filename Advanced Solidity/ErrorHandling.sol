//Contract Require Section

pragma solidity ^0.5.0;
contract Bank {
 mapping(address => uint) public accounts;
 
 function deposit() public payable {
    require(accounts[msg.sender] + msg.value >= accounts[msg.sender], “Overflow error”); 
    accounts[msg.sender] += msg.value;
 }
 
 function withdraw(uint money) public {
    require(money <= accounts[msg.sender]);
    accounts[msg.sender] -= money;
 }
}

***********************************************************************************************************
//Contract Revert Section

pragma solidity ^0.5.0;
 
contract Bank {
 mapping(address => uint) public accounts;
 
 function deposit() public payable {
    if(accounts[msg.sender] + msg.value >= accounts[msg.sender]) {
        revert("Overflow error");
    }
    accounts[msg.sender] += msg.value;
 }
 
 function withdraw(uint money) public {
    if(money <= accounts[msg.sender]){
    //can have more if statements
    revert();
    }
    accounts[msg.sender] -= money;
 }
}

***********************************************************************************************************
//Contract Assert Section

pragma solidity^0.5.0;
 
contract Math {
 
function add(uint256 a, uint256 b) internal pure returns (uint) {
    uint c = a + b;
    assert(c >= a);
    return c;
  }
 
 function multiply(uint256 a, uint256 b) internal pure returns (uint) {
    if (a == 0) {
      return 0;
    }
    uint c = a * b;
    assert(c / a == b);
    return c;
  }
} 
