# <h1 align="center"> Forge + EVM Toolkit Template </h1>

**Template repository for getting started quickly with Foundry and ETK projects**

![Tests](https://github.com/Saw-mon-and-Natalie/forge-etk-template/actions/workflows/test.yml/badge.svg)

## Getting Started

Click "Use this template" on [GitHub](https://github.com/Saw-mon-and-Natalie/forge-etk-template) to create a new repository with this repo as the initial state.

Or, if your repo already exists, run:
```sh
forge init
forge build
forge test
```

### Requirements

- [forge](https://github.com/foundry-rs/foundry)
- [eas](https://github.com/quilt/etk)

### Syntax Highlighting

For Visual Studio Code, you can use the [vscode-evm-toolkit](https://marketplace.visualstudio.com/items?itemName=Saw-mon-and-Natalie.vscode-evm-toolkit) extension.

## Writing your first test

All you need is to `import forge-std/Test.sol` and then inherit it from your test contract. Forge-std's Test contract comes with a pre-instatiated [cheatcodes environment](https://book.getfoundry.sh/cheatcodes/), the `vm`. It also has support for [ds-test](https://book.getfoundry.sh/reference/ds-test.html)-style logs and assertions. Finally, it supports Hardhat's [console.log](https://github.com/brockelmore/forge-std/blob/master/src/console.sol). The logging functionalities require `-vvvv`.

```solidity
pragma solidity 0.8.10;

import "forge-std/Test.sol";

contract ContractTest is Test {
    function testExample() public {
        vm.roll(100);
        console.log(1);
        emit log("hi");
        assertTrue(true);
    }
}
```

Make sure you load and etch your compiled bytecode, similiar to the following pattern:

```solidity
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
```

On a Windows machine, you would need to use the `scripts/compile.bat` and on Linux `scripts/compile.sh`.

Sample test file is provided in `test/Contract.t.sol`.

## Development

This project uses [Foundry](https://getfoundry.sh). See the [book](https://book.getfoundry.sh/getting-started/installation.html) for instructions on how to install and use Foundry.

## Credits

- [forge-template](https://github.com/foundry-rs/forge-template)