pragma solidity ^0.7.4;

contract WorkingWithVariables{
    
    uint256 public myUnit;
    bool public myBool;
    uint8 public myUnit8;
    
    function setMyUnit(uint _myUnit) public {
        
        myUnit = _myUnit;
    }
    
    
    function IncreaseUnit8() public{
        myUnit8++;
    }
    
    function DecreaseUnit8() public{
        myUnit8--;
    }
    
    

}