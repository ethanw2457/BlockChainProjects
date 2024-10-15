// SPDX-License-Identifier: MIT
pragma solidity ^0.8;


contract Parent {
    
    int public num;

    function changeNum(int _num) public {
        num = _num;
    }
}