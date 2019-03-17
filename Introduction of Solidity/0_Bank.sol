pragma solidity ^0.4.24;



contract Bank {
    mapping(address => uint) public accounts;
    
    function deposit(uint money) public {
        accounts[msg.sender] += money;
    }
    
    function withdraw(uint money) public {
        accounts[msg.sender] -= money;
    }
    

}

//Create a payable function that receives Ether and it will send tokens to the sender.
//Create a function that returns the available tokens supply.
contract SimpleToken {
    address owner;
    mapping (address => uint256) public accounts;
    
    constructor(uint256 initialSupply) public {
        owner = msg.sender; // The first who deploy this contract is the owner. so, msg.sender == owner
        accounts[owner] = initialSupply;
    }
    
    function checkBalance() constant public returns (uint){
        return accounts[msg.sender];
    }
    
    function remainedToken() view public returns (uint256) {
        return accounts[owner];
    }
    
    function transfer(address to, uint256 value) public {
        require(accounts[msg.sender] >= value); // check balance
        require(accounts[to] + value >= accounts[to]); // check overflow
        accounts[msg.sender] -= value;
        accounts[to] += value;
    }
    
    function buyToken(uint256 value) public payable returns (uint256){
        // in this function, the mse.sender is a person who want to buy token. 
        // NOT the token owner(who first deploy this contract)
        // DO NOT CONFUSE!
        // msg.value is the amount of token which the buyer want to buy.
        
        require(accounts[owner] >= value);
        require(accounts[msg.sender] + value >= accounts[msg.sender]);
        accounts[owner] -= value;
        accounts[msg.sender] += value;
    }
}
