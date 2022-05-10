//SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

import "./CloneFactory.sol";

contract Factory is CloneFactory {
    Child[] public children;
    address masterContract;

    constructor(address _masterContract) {
        masterContract = _masterContract;
    }

    function createChild(uint256 data) external {
        Child child = Child(createClone(masterContract));
        child.init(data);
        children.push(child);
    }

    function getChildren() external view returns (Child[] memory) {
        return children;
    }
}

contract Child {
    uint256 public data;

    // use this function instead of the constructor
    // since creation will be done using createClone() function
    function init(uint256 _data) external {
        data = _data;
    }
}
