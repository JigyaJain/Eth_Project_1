# Eth_Project_1
This solidity program is a smart contract of error handling. The project aims to know get to know about the implementation of three error handling statements that are require(), assert(), revert().

## Description

This smart contract is implementing the error handling statements via means of student"s profile management. There is one owner who setup the student's inital details and then the students can check then by using his uid and password provided bt the owner. There are two functions used in this program one is setDetails and another one is getDetails. Inside setDetails there is a assert statement and inside getDetails there are require and revert statements.
By this program the reader gets the real world implementation of error handling statements.

## Getting Started

### Executing program



    // SPDX-License-Identifier: MIT
    pragma solidity 0.8.26;
    
    // For this project, write a smart contract that implements the require(), assert() and revert() 
    // statements.
    
    contract ProfileManager{
        struct info{
            string name;
            uint section;
            uint percent;
        }
        
        address private owner = msg.sender;
        uint private uid;
        string private passkey;
        
        mapping (string => info) details;

        // Function to set details (only accessible by owner)
        function setDetails(uint _uid, string memory _pwd, string memory _name, uint _section, uint _percent) public{
        
            assert ( msg.sender == owner);
            uid = _uid;
            passkey = _pwd;
            details[_pwd] = info(_name, _section, _percent);
         }
         
         // Function to get details (only accessible by the user whose credentials are same as in aboce function)
         function getDetails(uint _uid, string memory _pwd) public view returns (string memory, uint, uint) {
             require ( uid == _uid, "Wrong Uid");
             
             if (!(keccak256(abi.encodePacked((passkey))) == keccak256(abi.encodePacked(_pwd))))
             {
                 revert("Password is incorrect");
             }
        
             info memory myInfo = details[_pwd];
             return (myInfo.name, myInfo.section, myInfo.percent);
          }

    }

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile ProfileManager.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ProfileManager" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the setDetails function, set up some details, click on the "transact" button to execute the function. Once you transact it then call the getDetails function and enter your uid and password and get the details.

## Authors

Jigya Jain

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
