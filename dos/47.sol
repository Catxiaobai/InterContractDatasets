pragma solidity >= 0.4.19 < 0.6.0;

contract Test1 {
    uint256 public goal = 5000;

    function getGoal() public view returns (uint256) {
        return goal;
    }

    function setGoal(uint256 x) public {
        goal = x;
    }

    function minus(uint amount) public {
        goal -= amount;
    }
    
}

contract Test2 {
    address[] members;
    mapping(address => uint256) wallet;
    
    function transferMoney(Test1 t1, address addr) public {
        for (uint i = 0; i < members.length; ++i) {
            require(members.length < 10);
            if (t1.getGoal() >= wallet[members[i]]) {
                members[i].transfer(wallet[members[i]]);
                wallet[members[i]] = 0;
            }
            else break;
        }
        

    }
}
/*


Test1:
608060405261138860005534801561001657600080fd5b5061016e806100266000396000f300608060405260043610610062576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff16806340193883146100675780634b29c44814610092578063b97a7d24146100bf578063d23aa460146100ea575b600080fd5b34801561007357600080fd5b5061007c610117565b6040518082815260200191505060405180910390f35b34801561009e57600080fd5b506100bd6004803603810190808035906020019092919050505061011d565b005b3480156100cb57600080fd5b506100d4610127565b6040518082815260200191505060405180910390f35b3480156100f657600080fd5b5061011560048036038101908080359060200190929190505050610130565b005b60005481565b8060008190555050565b60008054905090565b806000808282540392505081905550505600a165627a7a72305820468cdb9b50682624fc520a63069390ebe7f5efe02406f96391b956083c4d3fca0029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: false
Nest Call: false
Reentrancy: false
Code Coverage:0.9953917050691244
Miss recognized Jump: false
Cyclomatic Complexity: 2
Number of Instructions: 217

Running time：64ms

进程已结束,退出代码0


Test2:
608060405234801561001057600080fd5b506103a8806100206000396000f300608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063e7d0aae914610046575b600080fd5b34801561005257600080fd5b506100a7600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506100a9565b005b60008090505b60008054905081101561037757600a6000805490501015156100d057600080fd5b6001600080838154811015156100e257fe5b9060005260206000200160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020548373ffffffffffffffffffffffffffffffffffffffff1663b97a7d246040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b1580156101ac57600080fd5b505af11580156101c0573d6000803e3d6000fd5b505050506040513d60208110156101d657600080fd5b8101908080519060200190929190505050101515610367576000818154811015156101fd57fe5b9060005260206000200160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166108fc60016000808581548110151561025357fe5b9060005260206000200160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549081150290604051600060405180830381858888f193505050501580156102e4573d6000803e3d6000fd5b5060006001600080848154811015156102f957fe5b9060005260206000200160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000208190555061036c565b610377565b8060010190506100af565b5050505600a165627a7a72305820058d59868d178faaccb641656ccfd28b0d9ab094fc768a9c73878909aadac1b40029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: true
Nest Call: false
Reentrancy: false
Code Coverage:0.9976525821596244
Miss recognized Jump: false
Cyclomatic Complexity: 4
Number of Instructions: 426

Running time：107ms

进程已结束,退出代码0

*/