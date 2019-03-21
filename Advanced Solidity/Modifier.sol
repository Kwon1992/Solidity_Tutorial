pragma solidity ^0.4.24;

contract Purchase {
    address public seller;
    
    modifier onlySeller {
        require(msg.sender == seller);
        _; // can be locate before require().
    } 
    
    function abort() public view onlySeller {
        //..... 
        // will be added to location of "_;" in modifier 
    }
}

contract owned {
    constructor() public { owner = msg.sender; }
    address owner;
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

contract mortal is owned{
    function close() public onlyOwner {
        selfdestruct(owner); //??
        
        /**
         * 비활성화와 자기 소멸
         * 코드가 블록체인에서 코드가 지워지는 유일한 방법은 
         * 주소의 컨트랙트가 selfdestruct 연산을 사용했을 때입니다. 
         * 주소에 저장된 남은 Ether는 지정된 타겟으로 옮겨지고 
         * 스토리지와 코드는 해당 상태에서 지워집니다. 
         * 이론적으로 컨트랙트를 제거하는 것은 좋은 아이디어로 들릴지도 모르겠습니다만,
         * 잠재적으로 위험한 행위입니다.
         * 만일 누군가가 제거된 컨트랙트에 Ether를 전송하면, 
         * 해당 Ether는 영구적으로 손실되게 됩니다.
         * 
         * https://solidity-kr.readthedocs.io/ko/latest/introduction-to-smart-contracts.html
         */
    }
}

/**
 * pragma solidity ^0.5.0;
 
contract owned {
    constructor() public { owner = msg.sender; }
    address payable owner;
 
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}
 
contract mortal is owned {
 
    function close() public onlyOwner {
        selfdestruct(owner);
    }
}
 */
