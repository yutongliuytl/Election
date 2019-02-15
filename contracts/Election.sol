pragma solidity ^0.5.0;

contract Election {
  // Model Candidate
    struct Candidate {
        uint8 id;
        string name;
        uint8 count;
    }
    // Store accounts that voted
    mapping(address => bool) public voters;
    // Store Candidates
    // Fetch Candidates
    mapping(uint8 => Candidate) public candidates;
    // Store Candidates Count
    uint8 public candidatesCount;

    // voted event
    event votedEvent (
      uint8 indexed _candidateId
    );

    constructor () public {
        addCandidate("Shabi 1");
        addCandidate("Shabi 2");
    }

    function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote (uint8 _candidateId) public {
        // Check if the voter has already voted
        require(!voters[msg.sender], "Error");
        // Check if the vote is towards a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Error");
        // Record that the voter has voted
        voters[msg.sender] = true;
        // Update vote
        candidates[_candidateId].count ++;
        // Trigger voted event
        emit votedEvent(_candidateId);
    }
}
