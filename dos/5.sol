pragma solidity >= 0.4.19 < 0.6.0;

contract Test1 {
    mapping(address => uint256) safeWallet;

    function store(address addr, uint256 amount) public {
        safeWallet[addr] += amount;
    }
}

contract Test2 {

    address[] members;
    mapping(address => uint256) wallet;
    address owner;

    function addMember(address addr) public {
        members.push(addr);
    }

    function saveMoney(address addr, uint256 amount) public {
        wallet[addr] += amount;
    }

    function storeMoneySafe(Test1 t1) public {
        require(msg.sender == owner);
        for (uint i = 0; i < members.length; ++i) {
            uint256 amount = wallet[members[i]];
            wallet[members[i]] = 0;
            t1.store(members[i], amount);
            address(t1).transfer(amount);
        }
    }
}
/*

假阳性？给自己的钱包转账，自己的钱包不会故意抛出异常

Test1:
608060405234801561001057600080fd5b5061010a806100206000396000f300608060405260043610603f576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff168063a271ced2146044575b600080fd5b348015604f57600080fd5b50608c600480360381019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050608e565b005b806000808473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019081526020016000206000828254019250508190555050505600a165627a7a72305820c168ea524dd29dd962714c434f47a658544cfdd876e0943679041466366e63210029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: false
Nest Call: false
Reentrancy: false
Code Coverage:0.9906542056074766
Miss recognized Jump: false
Cyclomatic Complexity: 2
Number of Instructions: 107

Running time：85ms


Test2:
608060405234801561001057600080fd5b506104c8806100206000396000f300608060405260043610610057576000357c0100000000000000000000000000000000000000000000000000000000900463ffffffff1680639f76c5081461005c578063ab9780101461009f578063ca6d56dc146100ec575b600080fd5b34801561006857600080fd5b5061009d600480360381019080803573ffffffffffffffffffffffffffffffffffffffff16906020019092919050505061012f565b005b3480156100ab57600080fd5b506100ea600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291905050506103e2565b005b3480156100f857600080fd5b5061012d600480360381019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050610433565b005b600080600260009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614151561018e57600080fd5b600091505b6000805490508210156103dd576001600080848154811015156101b257fe5b9060005260206000200160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020549050600060016000808581548110151561022e57fe5b9060005260206000200160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020819055508273ffffffffffffffffffffffffffffffffffffffff1663a271ced26000848154811015156102c257fe5b9060005260206000200160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16836040518363ffffffff167c0100000000000000000000000000000000000000000000000000000000028152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200182815260200192505050600060405180830381600087803b15801561037357600080fd5b505af1158015610387573d6000803e3d6000fd5b505050508273ffffffffffffffffffffffffffffffffffffffff166108fc829081150290604051600060405180830381858888f193505050501580156103d1573d6000803e3d6000fd5b50816001019150610193565b505050565b80600160008473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001908152602001600020600082825401925050819055505050565b60008190806001815401808255809150509060018203906000526020600020016000909192909190916101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555050505600a165627a7a723058209b83b29fa7dddf8cd380d6f4f6734188155b74aae2f01d590613241c976a795c0029
Uncheck External Calls: false
Strict Balance Equality: false
Transaction State Dependency: false
Block Info Dependency: false
Greedy Contract: false
DoS Under External Influence: true
Nest Call: true
Reentrancy: false
Code Coverage:0.9981785063752276
Miss recognized Jump: false
Cyclomatic Complexity: 3
Number of Instructions: 549

Running time：139ms

*/