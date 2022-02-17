// SPDX-License-Identifier: MIT
/*

  << Project Wyvern Exchange >>

*/
pragma solidity ^0.8.9;

import "../exchange/Exchange.sol";

/**
 * @title WyvernExchange
 * @author Project Wyvern Developers
 */
contract ExchangeUpgradeV3 is Exchange {
    string public name;

    string public version;

    string public codename;

    mapping(string => bool) public testMapping;

    string public someVariable;

    // /**
    //  * @dev Initialize a WyvernExchange instance
    //  * @param registryAddress Address of the registry instance which this Exchange instance will use
    //  * @param tokenAddress Address of the token used for protocol fees
    //  */

    function __WyvernExchange_init(
        ProxyRegistry registryAddress,
        TokenTransferProxy tokenTransferProxyAddress,
        address tokenAddress,
        address protocolFeeAddress
    ) public initializer {
        Exchange.__Exchange_init();
        registry = registryAddress;
        tokenTransferProxy = tokenTransferProxyAddress;
        exchangeToken = tokenAddress;
        protocolFeeRecipient = payable(protocolFeeAddress);
        name = "Project Wyvern Exchange";
        version = "2.2";
        codename = "Bling Blong";
    }

    function createTest(string memory _name) public {
        testMapping[_name] = true;
    }

    function uselessFunction() public pure returns (uint256) {
        return 1 + 1;
    }
}
