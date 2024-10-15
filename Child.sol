pragma solidity 0.8;

import "./Parent.sol";

contract Child is Parent {
    string public name;

    function changeName(string memory _name) public {
        name = _name;
    }

    function changeNameAndNum(string memory _name, int num) public {
        changeName(_name);
        changeNum(num);
    }
}