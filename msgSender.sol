// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract msgSender {
    
    address public lastUser;
    int num;

    address owner;
    constructor() {
       owner = msg.sender;
       num = 5;
    }

    function setLastUser() public {
        require(msg.sender == owner);
        lastUser = msg.sender;
    }
}