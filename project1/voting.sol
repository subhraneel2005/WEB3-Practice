// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

contract Voting{

    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    mapping(uint => Candidate) public candidates;
    mapping(address => bool) public alreadyVoted;
    uint public candidatesCount;

    constructor(){
        addCandidate("Alice");
        addCandidate("Bob");
        addCandidate("Alice");
        addCandidate("Bob");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function voteCandidate(uint _candidateId) public{
        require(!alreadyVoted[msg.sender], "You have already voted" );
        require(_candidateId>0 && _candidateId<=candidatesCount, "Invalid Candiadte");

        alreadyVoted[msg.sender] = true;
        candidates[_candidateId].voteCount++;
    }

    function getWinner() public view returns(string memory _winnerName) {
        uint maxVotes=0;
        for(uint i=1; i<candidatesCount; i++){
            if(candidates[i].voteCount > maxVotes){
                maxVotes = candidates[i].voteCount;
                _winnerName = candidates[i].name;
            }
        }
    }
}