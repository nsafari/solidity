pragma solidity ^0.8.1;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract ShareWallet is Ownable {

    mapping(address => uint) public allowance;


    modifier ownerOrAllowed(uint _amount){
        require(owner() == msg.sender || allowance[msg.sender] >= _amount, 'You are not allowed');
        _;
    }

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount){
        _to.transfer(_amount);
    }

    function addAllowance(address _who, uint _amount) public onlyOwner{
        allowance[_who] += _amount;
    }

    receive () external payable {

    }
}
