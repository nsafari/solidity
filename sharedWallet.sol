pragma solidity ^0.8.1;

contract ShareWallet{
    
    function withdrawMoney(address payable _to, uint256 _amount) public{
        _to.transfer(_amount);
    }
    
    receive () external payable {
        
    }
}
