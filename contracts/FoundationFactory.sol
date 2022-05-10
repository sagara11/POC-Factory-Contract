// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Foundation.sol";
import "@optionality.io/clone-factory/contracts/CloneFactory.sol";

contract FoundationFactory is CloneFactory {
    address public libraryAddress;

    event FoundationCreated(address newFoundation);

    constructor(address _libraryAddress) {
        libraryAddress = _libraryAddress;
    }

    function setLibraryAddress(address _libraryAddress) public {
        libraryAddress = _libraryAddress;
    }

    function createFoundation(string memory _name) public {
        address clone = createClone(libraryAddress);
        Foundation(clone).init(_name);
        FoundationCreated(clone);
    }
}
