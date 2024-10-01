// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "./simple_parent.sol";

contract DeployingExample {
    struct SolidityObject {
        uint256 id;
        address owner;
    }
    SimpleStorage public S;
    function deploySimpleStorage() public {
        S = new SimpleStorage();
    }
    function readSimpleStorageData() public returns(uint256) {
        // createApple(1);
        return S.G();
    }
}