// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^ 5.0.0
pragma solidity ^0.8.22;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Chocolate is ERC20 {
    constructor() ERC20("Chocolate", "CHO") {
        _mint(msg.sender, 100 * 10 ** decimals());
    }
}