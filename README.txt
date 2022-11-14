HOW TO RUN:
1. Open entire workspace/folder in Remix.
2. Using the file explorer, navigate to the 'WatchItems.sol' and 'WatchTrader.sol' files under the contracts folder.
3. Compile both 'WatchItems.sol' and 'WatchTrader.sol' by selecting them and then selecting compile under the compile tab.
4. Complete tests by navigating to 

REMIX DEFAULT WORKSPACE

Remix default workspace is present when:
i. Remix loads for the very first time 
ii. A new workspace is created with 'Default' template
iii. There are no files existing in the File Explorer

This workspace contains 3 directories:

1. 'contracts': Holds two contracts. One to load items that can be sold and one containing trader functionality.
2. 'scripts': Contains four typescript files to deploy a contract. It is explained below.
3. 'tests': Contains one JS test file for 'WatchTrader' contract.

SCRIPTS

The 'scripts' folder has four typescript files which help to deploy the 'WatchItems' and 'WatchTrader' contract using 'web3.js' and 'ethers.js' libraries.

To run a script, right click on file name in the file explorer and click 'Run'. Remember, Solidity file must already be compiled.
Output from script will appear in remix terminal.

Please note, require/import is supported in a limited manner for Remix supported modules.
For now, modules supported by Remix are ethers, web3, swarmgw, chai, multihashes, remix and hardhat only for hardhat.ethers object/plugin.
For unsupported modules, an error like this will be thrown: '<module_name> module require is not supported by Remix IDE' will be shown.
