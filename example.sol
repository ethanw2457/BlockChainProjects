pragma solidity ^0.8.26; // states the version of the file, the '^' means any future version
// no null values in solidity, only default values
// int default value is = 0
// string default value is = ""
contract example { // Usually name the contract the same as the file name 

    string name= "example"; // Note that string is lowercase 
    bool exists = true;

    uint public num1 = 1;// allow for solidity to specify the size, uint can not be negative, initialized as private but can be changd to public
    // private variables are stored within the smartcontract and can not be accessed directly
    uint256 num2 = 1;// specify the size yourself by adding a number (256 is the biggest possible value)
    // You need to recompile everytime you make a change
    int num3 = -1; 

    address owner; // Usually declare the address variable and then define it later on in the code

    struct myStruct { // object of multiple variables, defines what myStruct is, syntax for creating a struct
        uint256 num; // contains num and string test
        string test;
    } 

    myStruct public struct1; // Declare the variable 

    myStruct[] public structs; // initialize an array of structs

    function changeStructs(uint256 n, string memory ntest) public {
        
        struct1.num = n; // calls the struct variable before changing it to the parameter
        struct1.test = ntest; 
        structs.push(struct1); // pushing a copy of struct1 into the myStruct array like a stack
    }

    function changeNum(uint256 a) public {
        num1 = a;
        require(a > 18); // if the require statement fails it will reverse the entire transaction
    }

    function getNum() view public returns (uint256) { // returns the type which is in the parenthesis
        return num1;
    }

    // function add(uint x, uint y) pure { ... }

    // mapping(address => uint256) public balances;
    // Initialization: balances[msg.sender] = 1000;
    // Access: uint256 myBalance = balances[msg.sender];
    // Updating Values: balances[msg.sender] += 500;
    // Delete: delete balances[msg.sender]
    // msg.sender is the sender of the account or contract that calls the function
    // msg.value is the transaction value when calling a function (usually 0)



}