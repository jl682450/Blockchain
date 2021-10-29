 //SPDX-License-Identifier: MIT
//pragma solidity >=0.6.0 <0.9.0;
pragma solidity ^0.6.0;

contract SimpleStorage {
    //will be initialized to 0
   uint256 favouriteNumber; 
   int favourite;
   bool favouriteBool = false;
  // string favouriteString = "String";
   //int256 favouriteInt = -110;
   //address favourtieaddress = 0x9673f77Dd92C8fE97E5990708De77E31Ec78355F;
   //byte favouriteBytes = "dog";
   //bytes32 favouriteBytes = "cat";
   struct People {
       uint256 favouriteNumber; 
       string name;
       
   }
   
   People[] public people;
   mapping(string => uint256) public nameToFavouriteNumber;
   
   //People public person = People({favouriteNumber:2, name: "Joel"});
   
   function store(uint256 _favouriteNumber) public {
       favouriteNumber = _favouriteNumber;
   }
   //view,pure
   //view function => blue
   //pure function perform arthmetic operation and other complex maths
   
   function retrieve() public view returns(uint256) {
       return favouriteNumber;
   }
   
   function Compute(uint256 favouriteNumber) public pure {
       favouriteNumber + favouriteNumber;
   }
   
   function Compute2(uint256 favouriteNumber) public pure returns(uint256) {
       return favouriteNumber + favouriteNumber;
   }
   
   function Compute3(uint256 favouriteNumber, uint favourite) public pure returns(uint256) {
       return favouriteNumber + favourite;
   }
   
   //memory - during execution of contract call
   //storage - after function executed - longterm storage
   
   function addPerson(string memory _name, uint256 _favouriteNumber) public {
       //people.push(People({favouriteNumber:_favouriteNumber, name: _name}));
       people.push(People(_favouriteNumber,_name));
       nameToFavouriteNumber[_name] = _favouriteNumber;
   }
}