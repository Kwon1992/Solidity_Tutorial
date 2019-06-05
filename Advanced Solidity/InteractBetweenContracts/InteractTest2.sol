pragma solidity 0.5.2;

import "./InteractTest1.sol";

contract InteractTest2 {
    InteractTest1 otherContract = InteractTest1(0x6ee9ADfB55adcb8a9E44AEa30133266F9238269d); // () 내부에 해당 컨트랙트 주소 
    
    function callTest1Func() public {
        otherContract.addOne();
        
    }
}
