pragma solidity ^0.4.24;
//pragma experimental ABIEncoderV2; // Why need? - solidity cannot pass struct as parameter on now.



contract Bank {
    struct Account {
        address addr;
        uint amount;
    }
    
    Account public acc = Account({
        addr:0x66ec542D55a86F2Fd0B0d9cB9f31bc20aC02477b,
        amount:50
    });
    // create new Account struct
    
    Account public acc2 = Account({
        addr:0x66ec542D55a86F2Fd0B0d9cB9f31bc20aC02477c,
        amount:50
    });
    
    function addAmount(uint _addMoney) public {
        acc.amount += _addMoney;
    }
    
    function withdraw(uint _withdrawMoney) public {
        acc.amount -= _withdrawMoney;
    }
    
    //Create a function transfer that deducts money from first account and adds them to the second
    function sendAmount(Account _from, Account _to, uint _amount) {
        _from.amount -= _amount;
        _to.amount += _amount;
    } 

    
    // how to code?
    
    // function sendAmount(uint _amount) {
    //     acc.amount -= _amount;
    //     acc2.amount += _amount;
        
    // }
    
    
}
