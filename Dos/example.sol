pragma solidity >=0.4.19 <0.6.0;

contract Insurance {
    uint256 actualTakeOffTime; //实际起飞时间

    function isDelayed(Flight flight, uint256 id) public view returns (bool) {
        uint256 scheduledTakeOffTime = flight.getScheduledTakeOffTime(id);
        if (actualTakeOffTime >= scheduledTakeOffTime + 4 hours) {
            return true;
        }
        return false;
    }
}

contract Flight {
    mapping(uint256 => uint256) public flightScheduledTakeOffTime; // 航班起飞时间的映射
    address[] public passengers; // 乘客数组，记录已购买保险的乘客

    function getScheduledTakeOffTime(uint256 FlightId) public view returns (uint256)
    {
        return flightScheduledTakeOffTime[FlightId];
    }

    function compensate(Insurance insurance,uint256 id) public payable {
        //如果航班延误，对所有购买该航班乘客进行赔付
        if (insurance.isDelayed(this, id)) { 
            for (uint256 i = 0; i < passengers.length; i++) {
                passengers[i].transfer(0.1 ether);  // Dos攻击
            }
        }
    }
}




