pragma solidity ^0.5.0;

contract Election {
  // Model Candidate
  struct Candidate {
    uint8 id;
    string name;
    uint8 count;
  }
  // Store Candidates
  // Fetch Candidates
  mapping(uint8 => Candidate) public candidates;
  // Store Candidates Count
  uint8 public candidatesCount;

  constructor () public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }

  function addCandidate (string memory _name) private {
    candidatesCount ++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }
}
