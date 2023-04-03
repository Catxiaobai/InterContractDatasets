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
        while (t1.getGoal() != 0) {
            addr.transfer(0.1 ether);
            t1.setGoal(t1.getGoal());
        }
    }
}
/*



Test1:
608060405261138860005534801561001657600080fd5b50610117806100266000396000f3006080604052600436106053576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063401938831460585780634b29c448146080578063b97a7d241460aa575b600080fd5b348015606357600080fd5b50606a60d2565b6040518082815260200191505060405180910390f35b348015608b57600080fd5b5060a86004803603810190808035906020019092919050505060d8565b005b34801560b557600080fd5b5060bc60e2565b6040518082815260200191505060405180910390f35b60005481565b8060008190555050565b600080549050905600a165627a7a723058204d79829179ccdbccc162d9fdbc4d040a4093e5830fbf51ba15e6dbef2f9a5d350029
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

Running time：61ms

进程已结束,退出代码0




Test2:
608060405234801561001057600080fd5b506102fb806100206000396000f300608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063e7d0aae914610046575b600080fd5b34801561005257600080fd5b506100a7600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506100a9565b005b5b60008273ffffffffffffffffffffffffffffffffffffffff1663b97a7d246040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b15801561011057600080fd5b505af1158015610124573d6000803e3d6000fd5b505050506040513d602081101561013a57600080fd5b81019080805190602001909291905050501415156102cb578073ffffffffffffffffffffffffffffffffffffffff166108fc67016345785d8a00009081150290604051600060405180830381858888f193505050501580156101a0573d6000803e3d6000fd5b508173ffffffffffffffffffffffffffffffffffffffff16634b29c4488373ffffffffffffffffffffffffffffffffffffffff1663b97a7d246040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b15801561022157600080fd5b505af1158015610235573d6000803e3d6000fd5b505050506040513d602081101561024b57600080fd5b81019080805190602001909291905050506040518263ffffffff167c010000000000000000000000000000000000000000000000000000000002815260040180828152602001915050600060405180830381600087803b1580156102ae57600080fd5b505af11580156102c2573d6000803e3d6000fd5b505050506100aa565b50505600a165627a7a72305820555bdc0a0462f4ca233c7ec67e06cb219d8f18e79d02f3334012db414d0cfbcb0029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: true
Nest Call: false
Reentrancy: false
Code Coverage:0.9972375690607734
Miss recognized Jump: false
Cyclomatic Complexity: 3
Number of Instructions: 362

Running time：92ms

进程已结束,退出代码0

*/