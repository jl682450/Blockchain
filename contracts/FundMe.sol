// SPDX-License-Identifier: MIT 
pragma solidity >=0.6.0 <0.9.0;
// pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract FundMe {
    using SafeMathChainlink for uint256;
    mapping(address => uint256) public addressToAmountFunded;
    
    function fund() public payable {
        //$50
        uint256 minimumUSD = 1*10**18;
        //gwei < $50
        require(getconversionrate(msg.value) >= minimumUSD, "Please add more ETH!" );
       addressToAmountFunded[msg.sender] += msg.value;
       //what eth to usd conversion rate 
    }
    
    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }
    
    function getPriceLatest() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        ( 
          ,int256 answer,,,
        ) = priceFeed.latestRoundData();
        return uint256(answer * 1000000000);
    }
    
    function getconversionrate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPriceLatest();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 100000000000000000;
        return ethAmountInUsd;
    }
}