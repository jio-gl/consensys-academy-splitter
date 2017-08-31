pragma solidity ^0.4.11;


import "./ConvertLib.sol";


// This is just a simple example of a coin-like contract.
// It is not standards compatible and cannot be expected to talk to other
// coin/token contracts. If you want to create a standards-compliant
// token, see: https://github.com/ConsenSys/Tokens. Cheers!

contract Owned {
    address owner;
    function Owned() { owner = msg.sender; }
}

contract Mortal is Owned {
    function kill() {
        if (msg.sender == owner) selfdestruct(owner);
    }
}

contract Splitter is Mortal {

        address alice;
        address bob;
        address carol;

        function MetaCoin(address a, address b, address c) {
                 alice = a;
                 bob = b;
                 carol = c;
        }

        mapping (address => uint) balances;

        event Deposit(address indexed _from, uint256 _value);

        function deposit() payable returns(bool success) {
                // only our 3 friends can deposit
                // make the contract a utility that can be used by David, Emma and anybody with an address
                //if (msg.sender != alice && msg.sender != bob && msg.sender != carol) throw;
                if (msg.sender != alice) {
                   balances[msg.sender] += msg.value;
                } else {
                  balances[bob] += msg.value / 2 ;
                  balances[carol] += msg.value / 2 ;
                }
		// if odd send one wei (change) to sender
		if (msg.value % 2 == 1) {
		   balances[msg.sender] += 1 ;
		}
		Deposit(msg.sender, msg.value);
                return true;
        }

        function getTotalFunds() returns(uint) {
                 return this.balance ;
        }

        function getBalanceOf(address addr) returns(uint){
                 return balances[addr];
        }

}

