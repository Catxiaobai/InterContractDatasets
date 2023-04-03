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
    function transferMoney(Test1 t1, address addr) public {
        addr.transfer(0.1 ether);
    }
}
/*



Test1:
608060405261138860005534801561001657600080fd5b50610117806100266000396000f3006080604052600436106053576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063401938831460585780634b29c448146080578063b97a7d241460aa575b600080fd5b348015606357600080fd5b50606a60d2565b6040518082815260200191505060405180910390f35b348015608b57600080fd5b5060a86004803603810190808035906020019092919050505060d8565b005b34801560b557600080fd5b5060bc60e2565b6040518082815260200191505060405180910390f35b60005481565b8060008190555050565b600080549050905600a165627a7a723058203e3623001e7250f7f9c4dc2a207f171952c1b9ba774392c6b4ad36d761bc61df0029
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

Running time：58ms

进程已结束,退出代码0



Test2:
608060405234801561001057600080fd5b50610122806100206000396000f300608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063e7d0aae9146044575b600080fd5b348015604f57600080fd5b5060a2600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919050505060a4565b005b8073ffffffffffffffffffffffffffffffffffffffff166108fc67016345785d8a00009081150290604051600060405180830381858888f1935050505015801560f1573d6000803e3d6000fd5b5050505600a165627a7a723058200dda566c0bdcefb994703fa32c8f4362dd5d115178098d9b7b9f567197687e5e0029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: false
Nest Call: false
Reentrancy: false
Code Coverage:0.9916666666666667
Miss recognized Jump: false
Cyclomatic Complexity: 2
Number of Instructions: 120

Running time：63ms

进程已结束,退出代码0


*/