pragma solidity >= 0.4.19 < 0.6.0;

contract Test1 {
    uint256 public goal = 5000;

    function getGoal() public view returns (uint256) {
        return goal;
    }

    function setGoal(uint256 x) public {
        goal = x;
    }
    
}

contract Test2 {
    address[] members;
    mapping(address => uint256) wallet;
    function transferMoney(Test1 t1, address addr) public {
        for (uint i = 0; i < members.length; ++i) {
            wallet[members[i]] = t1.getGoal();
        }
        addr.transfer(0.1 ether);
    }
}
/*



Test1:
608060405261138860005534801561001657600080fd5b50610117806100266000396000f3006080604052600436106053576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063401938831460585780634b29c448146080578063b97a7d241460aa575b600080fd5b348015606357600080fd5b50606a60d2565b6040518082815260200191505060405180910390f35b348015608b57600080fd5b5060a86004803603810190808035906020019092919050505060d8565b005b34801560b557600080fd5b5060bc60e2565b6040518082815260200191505060405180910390f35b60005481565b8060008190555050565b600080549050905600a165627a7a723058209197eaacd2873b5df5d46e2165b2eb2d68072c5e6d415997b6d1cf4fc2328d600029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: false
Nest Call: false
Reentrancy: false
Code Coverage:0.9937106918238994
Miss recognized Jump: false
Cyclomatic Complexity: 2
Number of Instructions: 159

Running time：59ms

进程已结束,退出代码0



Test2:
608060405234801561001057600080fd5b50610261806100206000396000f300608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063e7d0aae914610046575b600080fd5b34801561005257600080fd5b506100a7600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506100a9565b005b60008090505b6000805490508110156101e1578273ffffffffffffffffffffffffffffffffffffffff1663b97a7d246040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b15801561012057600080fd5b505af1158015610134573d6000803e3d6000fd5b505050506040513d602081101561014a57600080fd5b810190808051906020019092919050505060016000808481548110151561016d57fe5b9060005260206000200160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508060010190506100af565b8173ffffffffffffffffffffffffffffffffffffffff166108fc67016345785d8a00009081150290604051600060405180830381858888f1935050505015801561022f573d6000803e3d6000fd5b505050505600a165627a7a72305820d3cbcf1d7c7f50195eb1be9fc934c6cc024c65a6e5cadad4cffc4f1993e072ee0029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: false
Nest Call: true
Reentrancy: false
Code Coverage:0.9964028776978417
Miss recognized Jump: false
Cyclomatic Complexity: 3
Number of Instructions: 278

Running time：91ms

进程已结束,退出代码0


*/