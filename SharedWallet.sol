pragma solidity ^0.8.1;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract ShareWallet is Ownable {

    function withdrawMoney(address payable _to, uint256 _amount) public onlyOwner{
        _to.transfer(_amount);
    }

    receive () external payable {

    }
}
