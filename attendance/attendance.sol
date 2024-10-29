// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Attendance {
    address[] interacted;

    mapping(address => string) addressToName;

    function markAttendance(string memory name) public {
        // msg.sender
        interacted.push(msg.sender);
        addressToName[msg.sender] = name;
    }

    function getInteracted() view public returns (address) {
        return interacted;
    }

}