pragma solidity ^0.8.1;

contract StartStopUpdateExample{
    
    address owner;
    bool public paused;
    
    constructor() {
        owner = msg.sender;
    }
    
    function recieveMoney() payable public{
        
    }
    
    function getBalance() public view returns(uint){
        
        return address(this).balance;
    }
    
    function withdrawMoney(address payable _to) public {
        
        require(msg.sender == owner, "You are not the owner");
        require(!paused, "The contract is paused");
         _to.transfer(address(this).balance);
    }
    
    function setPaused(bool _paused) public {
        
        require(msg.sender == owner, "You are not the owner");
        paused = _paused;
    }
    
    function destroySmartContaract(address payable _to) public {
        
        require(msg.sender == owner, "You are not the owner");
        selfdestruct(_to);
    }
    
}