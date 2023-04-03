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
    
    function transferMoney(Test1 t1, address addr) public {
        t1.setGoal(50);
        for (uint i = 0; i < members.length && i < t1.getGoal(); ++i) {
            if (i >= 20) break;
            members[i].transfer(0.1 ether);
        }
    }
}
/*



Test1:
608060405261138860005534801561001657600080fd5b50610117806100266000396000f3006080604052600436106053576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063401938831460585780634b29c448146080578063b97a7d241460aa575b600080fd5b348015606357600080fd5b50606a60d2565b6040518082815260200191505060405180910390f35b348015608b57600080fd5b5060a86004803603810190808035906020019092919050505060d8565b005b34801560b557600080fd5b5060bc60e2565b6040518082815260200191505060405180910390f35b60005481565b8060008190555050565b600080549050905600a165627a7a723058204160ce9df28a83fa7c4f961b915488d8479a769685a4a61c1285a4c0e356c2460029
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

Running time：63ms

进程已结束,退出代码0



Test2:
608060405234801561001057600080fd5b506102c1806100206000396000f300608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063e7d0aae914610046575b600080fd5b34801561005257600080fd5b506100a7600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506100a9565b005b60008273ffffffffffffffffffffffffffffffffffffffff16634b29c44860326040518263ffffffff167c010000000000000000000000000000000000000000000000000000000002815260040180828152602001915050600060405180830381600087803b15801561011b57600080fd5b505af115801561012f573d6000803e3d6000fd5b50505050600090505b600080549050811080156101e957508273ffffffffffffffffffffffffffffffffffffffff1663b97a7d246040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b1580156101ab57600080fd5b505af11580156101bf573d6000803e3d6000fd5b505050506040513d60208110156101d557600080fd5b810190808051906020019092919050505081105b15610290576014811015156101fd57610290565b60008181548110151561020c57fe5b9060005260206000200160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166108fc67016345785d8a00009081150290604051600060405180830381858888f19350505050158015610284573d6000803e3d6000fd5b50806001019050610138565b5050505600a165627a7a72305820367bd5c5c2aa3d02e2e01e3bad48af5ebaa6d4a984ea5958008126d5016960140029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: true
Nest Call: true
Reentrancy: false
Code Coverage:0.9970501474926253
Miss recognized Jump: false
Cyclomatic Complexity: 5
Number of Instructions: 339

Running time：102ms

进程已结束,退出代码0


*/