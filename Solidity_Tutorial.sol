pragma solidity ^0.4.24;
 
contract Messenger{
    address owner;
    string[] messages;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function add(string newMessage) public {
        require(msg.sender == owner);
        messages.push(newMessage);
    }
    
    function count() view public returns (uint) {
        return messages.length;
    }
    
    function getMessages(uint index) view public returns (string) {
        return messages[index];
    }
}

/**
 * For anyone who wants to use this in the newer version of solidity ^0.5.1 use the code below. 
The difference is that we need to specify that our strings are "memory variables explicitly":

pragma solidity ^0.5.1;
 
contract Messenger{
    address owner;
    string[] messages;
    
    constructor() public {
        owner = msg.sender;
    }
    
    function add(string memory newMessage) public {
        require(msg.sender == owner);
        messages.push(newMessage);
    }
    
    function count() view public returns(uint){
        return messages.length;
    }
    
    function getMessages(uint index) view public returns(string "memory"){
        return messages[index];
    }
}
*/
