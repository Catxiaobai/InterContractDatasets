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
        if (3000 < goal) {
            while (true) {
                addr.transfer(0.1 ether);
            }
        }
    }
}