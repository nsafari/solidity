pragma solidity ^0.8.1;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract Allowance is Ownable {

    event AllowanceChanged(address indexed _forWho, address indexed _byWhom, uint _oldAmount, uint _newAmount);
    mapping(address => uint) public allowance;


    modifier ownerOrAllowed(uint _amount){
        require(isOwner() || allowance[msg.sender] >= _amount, 'You are not allowed');
        _;
    }

    function addAllowance(address _who, uint _amount) public onlyOwner{
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] += _amount;
    }

    function isOwner() internal view returns (bool) {
        return owner() == msg.sender;
    }

    function reduceAllowance(address _who, uint _amount) internal {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who] - _amount);
        allowance[_who] -= _amount;
    }


}

contract ShareWallet is Allowance {

    function withdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount){
        require(_amount <= address(this).balance, "There is not enough balance");
        if(!isOwner()){
            reduceAllowance(msg.sender, _amount);
        }

        _to.transfer(_amount);
    }


    receive () external payable {

    }
}
