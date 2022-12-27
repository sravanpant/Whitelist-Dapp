// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddress;

    // Create a mapping of whitelistedAddress
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping (address => bool) public whitelistAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    // NOTE: Don't change this variable name, as it will be part of verification
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddress = _maxWhitelistedAddresses;
    }

    /* 
        addAddressToWhitelist - This function adds the address of the sender to the 
        whitelist
    */
    function addAddressToWhitelist() public {
        // check if the user has already been whitelisted 
        require(!whitelistAddresses[msg.sender], "Sender has already been whitelisted");
        // check if the numberAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numAddressesWhitelisted < maxWhitelistedAddress, "More addresses can't be added, limit reached");
        // Add the address which called the function to the whitelistedAddress array
        whitelistAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses 
        numAddressesWhitelisted += 1;
    }

}