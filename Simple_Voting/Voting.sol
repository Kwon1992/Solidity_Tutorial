pragma solidity >=0.4.0 <0.6.0;
// we have to specify what version of compiler this code will compile with

contract Voting {
    mapping(bytes32 => uint256) public votesReceived;
    /* key : candidates name 
     * value : store the vote count

    /* 솔리디티는 생성자에 string array를 아직까지 허용하지 않음.
     * 따라서 string 대신 bytes32를 사용함. 
    **/

    bytes32[] public candidateList;

    constructor(bytes32[] memory candidateNames) public {
        candidateList = candidateNames;
    }
    // 위의 생성자에 따르면, 우리는 이 컨트랙트를 deploy할 때 같이 array를 pass 해야함.
    // Q) 왜 인자에 memory?

    function totalVotesFor(bytes32 candidate) view public returns (uint256) {
        require(validCandidate(candidate)); // 검증
        return votesReceived[candidate]; // 반환
    }

    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate)); // 검증
        votesReceived[candidate] += 1; // 투표 수 추가
    }


    function validCandidate(bytes32 candidate) view public returns (bool) {
        for(uint i = 0; i < candidateList.length ; i++) {
            if (candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }

} 
