// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract ContractTest is Test {
    address golf;
    address user;

    function _loadCode(address addr) internal {
        string[] memory inputs = new string[](2);
        /**
         * windows: scripts/compile.bat
         * linux  : scripts/compile.sh
         */
        inputs[0] = "scripts/compile.bat";

        // path/to/contract.etk
        inputs[1] = "src/Contract.etk";

        bytes memory bytecode = vm.ffi(inputs);

        emit logs(bytecode);

        vm.etch(addr, bytecode);
    }
    function setUp() public {
        golf = address(0x9014);
        user = address(0x900d);

        vm.label(golf, "Golf");
        vm.label(user, "User");

        _loadCode(golf);
    }

    function testExample() public {
        assertTrue(true);
    }
}
