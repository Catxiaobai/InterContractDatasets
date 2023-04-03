pragma solidity >=0.4.19 <0.6.0;

contract Insurance {
    uint8 constant insuranceType = 1; //保险类型

    function getInsuranceType() public pure returns (uint8) {
        return insuranceType;
    }
}

contract Flight {
    uint8 premium; 

    function compensate(Insurance insurance, uint8 x) public view {
        uint8 insuranceType = x;
        uint8 total = 0;

        if (insuranceType == 1) {
            premium = total; //整数溢出
        } else if (insuranceType == 0) {
            total = 2;
        } else {
            total = 5;
        }
        premium = premium + 100;
    }
}



