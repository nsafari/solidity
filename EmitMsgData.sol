pragma solidity ^0.8.0;

contract EmitMsgData {
    
    event LogMsgData(bytes data);
    event LogMsgValue(uint data);
    
    fallback() external payable{
        emit LogMsgData(msg.data);
    }
    
    receive() external payable{
        emit LogMsgValue(msg.value);
    }
    
    function balance() external view returns(uint256) {
        return address(this).balance;
    }
}

