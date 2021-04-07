pragma solidity ^0.8.1;

contract SendMoneyExample{
 
    uint public balanceRecived;
    
    function reciveMoney() public payable{
        balanceRecived += msg.value;
    }
    
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function withdrawMoney() public {
        address payable to = payable(msg.sender);
        
        to.transfer(this.getBalance());
    }
}