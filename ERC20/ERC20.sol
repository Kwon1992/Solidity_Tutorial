pragma solidity ^0.5.2;

contract MyToken{

    string name;
    string symbol;
    uint8 decimals;

    uint256 private initialTokens;
    uint256 private totalTokens;
    uint256 private tokenPrice;  // 1ETH에 몇 개의 토큰을 줄 것인가.

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) private allowed; 

    constructor (string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialTokens, uint256 _tokenPrice) public payable { // Constructor only called once when deployed.
        name = _name;
        symbol = _symbol;
        decimals = _decimals; // usually 18   [[1 eth = 1wei * 10^18]]
        initialTokens = _initialTokens;
        totalTokens = _initialTokens;
        tokenPrice = _tokenPrice;
    }
    

    function buyToken() payable public returns (uint boughtTokens) {
        uint tokensToBuy = msg.value / tokenPrice;
        require(balances[msg.sender] + tokensToBuy > balances[msg.sender]); // watch for overflow
        require(totalTokens > tokensToBuy);
        balances[msg.sender] += tokensToBuy;
        totalTokens -= tokensToBuy;
        return tokensToBuy;
    }

    function transfer(address to, uint256 value) external returns (bool) {
        require(balances[msg.sender] >= value); // need more balance than value.
        require(balances[to] != 0x0); // "to" must have an account for transfer. 
        require(balances[to] + value > balances[to]); // caution for overflow.
        balances[msg.sender] -= value;
        balances[to] += value;
        
        emit Transfer(msg.sender, to, value);
        return true;
    }

    function approve(address spender, uint256 value) external returns (bool) {
        allowed[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
    
    function allowance(address owner, address spender) public view returns (uint256) {
        return allowed[owner][spender];
    }

    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        require(balances[from] != 0x0 && balances[to] != 0x0);
        require(balances[from] >= value);
        require(balances[to] + value > value);
        require(allowance(from, msg.sender) != 0);
        
        balances[from] -= value;
        balances[to] += value;
        allowed[from][msg.sender] -= 1; // sub 1 from count of approve
        return true;

    }

    function totalSupply() external view returns (uint256) { 
        return totalTokens;
    }

    function balanceOf(address who) external view returns (uint256) {
        return balances[who];
    }



    event Transfer(address indexed from, address indexed to, uint256 value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}
