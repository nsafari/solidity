pragma solidity >=0.6.0 <0.7.6;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v3.0.0/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20{
    constructor(string memory name, string memory symbol) public ERC20(name, symbol){
        
        _mint(msg.sender, 100 * 10 ** uint(decimals()));
    }
}
