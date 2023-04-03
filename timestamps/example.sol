pragma solidity >=0.4.19 <0.6.0;

contract Flight {
    mapping(uint256 => uint256) public flightScheduledTakeOffTime; // 航班起飞时间的映射

    function getScheduledTakeOffTime(uint256 FlightId) public view returns (uint256) {
        return flightScheduledTakeOffTime[FlightId];
    }
}

contract Insurance {
    // 查询航班是否延误
    function isDelayed(Flight flight, uint256 id) public view returns (bool) {
        uint256 scheduledTakeOffTime = flight.getScheduledTakeOffTime(id);
        if (block.timestamp >= scheduledTakeOffTime + 4 hours) {   //时间间戳依赖漏洞
            return true;
        }
        return false;
    }
}



