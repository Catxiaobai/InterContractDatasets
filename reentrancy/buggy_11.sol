contract Test1 {
    uint public goal = 5000;
    function getGoal() public view returns(uint) {
        return goal;
    }
}

contract Test2 {
    function transferMoney (Test1 t1, address addr) public {
        uint goal = t1.getGoal();
        if (3000 < goal && goal < 5000) {
            addr.call.value(10)("");
        }
    }
}
