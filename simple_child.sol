// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./simple_parent.sol";

contract DeployingExample {
    struct SolidityObject {
        uint256 id;
        address owner;
    }
    address owner;
    address receiver;
    SimpleStorage public S;
    constructor(address receiverio) { // used to deploy and then pretty much never used again
        owner = msg.sender;
        receiver = receiverio;
    }
    modifier _onlyOwner() {
        _; // means all the funciton code will run before the require statement before the funciton ends but you could also put it behind the require statement so that the requirement statement runs before the code instead
        require(msg.sender == owner, "Wrong Address");
    }
    function deploySimpleStorage() public _onlyOwner {
        S = new SimpleStorage();
    }
    function readSimpleStorageData() public _onlyOwner returns(uint256) {
        // createApple(1);
        return 1;
    }
    function SimpleStorageData() public _onlyOwner returns(uint256) {
        
        // createApple(1);
        return 1;
    }
}