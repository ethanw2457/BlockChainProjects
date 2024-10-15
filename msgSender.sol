// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract msgSender {
    
    address public lastUser;

    // address owner;
    // constructor() {
    //    owner = msg.sender;
    // }

    function setLastUser() public {
        lastUser = msg.sender;
    }
}