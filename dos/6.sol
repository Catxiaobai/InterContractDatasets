pragma solidity >= 0.4.19 < 0.6.0;

contract Test1 {
    uint256 public goal = 5000;

    function getGoal() public view returns (uint256) {
        return goal;
    }

    function sendGoal(address addr, Test2 t2) public {
        t2.sendFixedAmount(addr, goal);
    }
    
}

contract Test2 {

    address[] members;
    address thisSC;

    function addMember(address addr) public {
        members.push(addr);
    }

    function transferMoney(Test1 t1, address addr) public {
        for (uint i = 0; i < members.length; ++i) {
            if (t1.getGoal() > 100)
            t1.sendGoal(members[i], Test2(thisSC));
        }
    }

    function sendFixedAmount(address addr, uint256 amount) public {
        addr.transfer(amount);
    }
}
/*
假阴性，来回调用，本质还是循环和转账分离


Test1:
608060405261138860005534801561001657600080fd5b50610211806100266000396000f300608060405260043610610057576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063401938831461005c578063b97a7d2414610087578063eda4728a146100b2575b600080fd5b34801561006857600080fd5b50610071610115565b6040518082815260200191505060405180910390f35b34801561009357600080fd5b5061009c61011b565b6040518082815260200191505060405180910390f35b3480156100be57600080fd5b50610113600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050610124565b005b60005481565b60008054905090565b8073ffffffffffffffffffffffffffffffffffffffff1663953300be836000546040518363ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200182815260200192505050600060405180830381600087803b1580156101c957600080fd5b505af11580156101dd573d6000803e3d6000fd5b5050505050505600a165627a7a7230582094325b84af764e2b30483eec32af802f3e200617c9c3bce9ed976d40f74b178e0029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: false
Nest Call: false
Reentrancy: false
Code Coverage:0.9959016393442623
Miss recognized Jump: false
Cyclomatic Complexity: 2
Number of Instructions: 244

Running time：111ms

Test2:
608060405234801561001057600080fd5b5061043c806100206000396000f300608060405260043610610057576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063953300be1461005c578063ca6d56dc146100a9578063e7d0aae9146100ec575b600080fd5b34801561006857600080fd5b506100a7600480360381019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019092919050505061014f565b005b3480156100b557600080fd5b506100ea600480360381019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919050505061019a565b005b3480156100f857600080fd5b5061014d600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050610203565b005b8173ffffffffffffffffffffffffffffffffffffffff166108fc829081150290604051600060405180830381858888f19350505050158015610195573d6000803e3d6000fd5b505050565b60008190806001815401808255809150509060018203906000526020600020016000909192909190916101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055505050565b60008090505b60008054905081101561040b5760648373ffffffffffffffffffffffffffffffffffffffff1663b97a7d246040518163ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401602060405180830381600087803b15801561027c57600080fd5b505af1158015610290573d6000803e3d6000fd5b505050506040513d60208110156102a657600080fd5b81019080805190602001909291905050501115610400578273ffffffffffffffffffffffffffffffffffffffff1663eda4728a6000838154811015156102e857fe5b9060005260206000200160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff166040518363ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200192505050600060405180830381600087803b1580156103e757600080fd5b505af11580156103fb573d6000803e3d6000fd5b505050505b806001019050610209565b5050505600a165627a7a72305820aaae3274de39c7955b276300be64eefbecf5ad61037207cea5e164e2e50176710029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: false
Nest Call: false
Reentrancy: false
Code Coverage:0.9980276134122288
Miss recognized Jump: false
Cyclomatic Complexity: 4
Number of Instructions: 507

Running time：174ms
*/