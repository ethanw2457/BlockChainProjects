// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract Attendance {
    address[] interacted;

    mapping(address => string) addressToName;

    function markAttendance(string name) public {
        msg.sender;
    }

}