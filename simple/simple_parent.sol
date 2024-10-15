// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    uint256 public G = 4;
    struct Apple {
        uint256 id;
        uint256 data;
        address owner;
    }
    modifier onlyValid(uint256 id, uint256 data) {
        require(data%2 ==0); // data should be even
        _;
        require(msg.sender == apples[id].owner);
    }
    mapping (uint256 => Apple) apples;
    function edit(uint256 id, uint256 data) public onlyValid(id, data) {
        require(msg.sender == apples[id].owner);
        apples[id].data = data;
          require(data%2 ==0); //data should be even
    }
    function createApple(uint256 id) public { 
        Apple memory apple = Apple(id, 1234, msg.sender);
        apples[id] = apple;
    }
    function hellosir() public {
        G = 5;
    }
}