// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        // Before StartBroadcast no real Tx;
        HelperConfig helperConfig = new HelperConfig();
        address ethUSdPriceFeed = helperConfig.activeNetworkConfig();
        vm.startBroadcast();
        // After Start Broadcast real Tx;
        FundMe fundMe = new FundMe(ethUSdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
