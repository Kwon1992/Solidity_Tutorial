pragma solidity ^0.4.24;

contract SmartExchanger {
    event Deposit(address from, bytes32 to, uint indexed value);
    event Transfer(bytes32 from, address to, uint indexed value);
    event Event2(address from, bytes32 to);
    
    function deposit(bytes32 to) payable public {
        emit Deposit(msg.sender, to, msg.value);
        emit Event2(msg.sender, to);
    }
    
    function transfer(bytes32 from, address to, uint value) payable public {
        to.transfer(value);
        emit Transfer(from, to, value);
    }
}

/**
 * For solidity ^5.0.0 you need to add payable to the address to in the function.

This is due to some breaking changes in Solidity version 0.5. Namely that an address has to be marked as payable 
 - otherwise it won't have the transfer function. 
 More info here: https://solidity.readthedocs.io/en/v0.5.0/050-breaking-changes.html#explicitness-requirements

Code updated for solidity ^0.5.0:

pragma solidity ^0.5.0;
 
contract SmartExchange {
	event Deposit(address from, bytes32 to, uint indexed  value);
	event Transfer(bytes32 from, address to, uint indexed value);
 
	function deposit(bytes32 to) payable public {
		emit Deposit(msg.sender, to, msg.value);
	}
 
	function transfer(bytes32 from, address payable to, uint value) payable public{
		to.transfer(value);
		emit Transfer(from, to, value);
	}
}
