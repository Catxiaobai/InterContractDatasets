pragma solidity >=0.4.19 <0.6.0;

contract Test1 {
    function getGoal() public pure returns (uint256) {
        return 5000;
    }
}

contract Test2 {
    uint256 balance = 100;

    function getValue() public pure returns (uint256) {
        return 100;
    }

    function transferMoney(Test1 t1, address addr) public {
        uint256 goal = t1.getGoal();
        if (3000 < goal) {
            //require(balance > 10);
            !addr.call.value(10)();
            balance -= 10;
        } else {
            !addr.call.value(20)();
        }
        uint256 value = getValue();
        !addr.call.value(value)();
    }
}
