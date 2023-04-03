pragma solidity >= 0.4.19 < 0.6.0;

contract Test1 {
    uint256 public goal = 5000;

    function getGoal() public view returns (uint256) {
        return goal;
    }
}

contract Test2 {

    function transferMoney(Test1 t1, address addr) public {
        uint256 goal = t1.getGoal();
        while (goal > 100) {
            addr.transfer(1 ether);
            goal += 1;
        }
    }

}

/*

真阳性？

Test2:

608060405234801561001057600080fd5b506101e1806100206000396000f300608060405260043610610041576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063e7d0aae914610046575b600080fd5b34801561005257600080fd5b506100a7600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506100a9565b005b60008273ffffffffffffffffffffffffffffffffffffffff1663b97a7d246040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b15801561010f57600080fd5b505af1158015610123573d6000803e3d6000fd5b505050506040513d602081101561013957600080fd5b810190808051906020019092919050505090505b60648111156101b0578173ffffffffffffffffffffffffffffffffffffffff166108fc670de0b6b3a76400009081150290604051600060405180830381858888f193505050501580156101a4573d6000803e3d6000fd5b5060018101905061014d565b5050505600a165627a7a72305820281bc1cf47157ebe73b6b47e1587fd76d56a23c340c7abe167f005588a35ef1b0029

Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: true
Nest Call: false
Reentrancy: false
Code Coverage:0.9955156950672646
Miss recognized Jump: false
Cyclomatic Complexity: 3
Number of Instructions: 223

Running time：155ms

进程已结束,退出代码0



*/