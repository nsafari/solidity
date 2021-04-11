pragma solidity ^0.8.1;

contract EventExample{
    
    mapping(address => uint) public totalBalance;
    
    event TokenSent(address _from, address _to, uint _amount);
    
    constructor(){
        
        totalBalance[msg.sender] = 100;
    }
    
    function transfer(address _to, uint _amount) public payable {
        
        require(totalBalance[msg.sender] >= _amount);
        require(totalBalance[_to] + _amount >= totalBalance[_to]);
        require(totalBalance[msg.sender] - _amount <= totalBalance[msg.sender]);
        
        totalBalance[msg.sender] -= _amount;
        totalBalance[_to] += _amount;
        
        emit TokenSent(msg.sender, _to, _amount);
    }
    

}