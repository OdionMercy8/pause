// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract pause{
    mapping(address => uint) public balances;
    mapping(address => uint) public  NofDeposit;

    address[] allDespositors;


    function desposit()  external payable{
        require(msg.value == 1 ether, "must equal to 1 ether");
        balances[msg.sender] += msg.value;
        if(balances[msg.sender] < 0) {
            allDespositors.push(msg.sender);
        }
        NofDeposit[msg.sender]++;
    } 

    function borrow() external{
        for(uint i = 0 ; i < allDespositors.length; i++){
           require(msg.sender == allDespositors[i], "not a member");
        } // use balance mapping
        require(NofDeposit[msg.sender] == 10, "not consi");
        uint amountToBorrow = calucalatePauseBal();
        (bool send,) = payable(msg.sender).call{value : amountToBorrow}("");
        require(send, "failed"); 
    }

    function pauseBal() external view returns(uint){
        return address(this).balance;
    }

    function calucalatePauseBal() internal view returns(uint){
        uint bal = address(this).balance;
        return (bal *80) / 100;
    }
}

///////////////////////////////////////////////////////////////////////
contract createMorePause{
    pause[] public allContracts;

    function newOnes() external {crecreateMorePauseateMorePause
        allContracts.push(new pause());    
    }

    function returnPurse() public view returns(pause[] memory) {
        return allContracts;



        
    }
}