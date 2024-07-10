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

