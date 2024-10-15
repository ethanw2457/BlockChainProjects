// SPDX-License-Identifier: MIT
pragma solidity ^0.8;

contract msgValueExample {
    
    int num;

    function payForReturn() payable public returns(uint256) {
        return msg.value;
    }

    function requirePaymentForNum() payable public {
        
        num += 1;
        require(msg.value == 5);
        
    }
}