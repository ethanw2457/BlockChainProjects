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
    function deploySimpleStorage() public {
        S = new SimpleStorage();
    }
    function readSimpleStorageData() public returns(uint256) {
        // createApple(1);
        return 1;
    }
    function SimpleStorageData() public returns(uint256) {
        require(msg.sender == owner, "Wrong Address");
        createApple(1);
        return 1;
    }
}