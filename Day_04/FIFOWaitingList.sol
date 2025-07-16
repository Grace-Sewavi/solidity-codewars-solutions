// File: Day_04/FIFOWaitingList.sol

/* Instruction: Let's create a smart contract with a FIFO queue-like interface that may serve as a simple waiting list.

Requirements:
The user should be able to add themselves (i.e. their address) to the end of the queue by calling the push method. It should take no arguments.
A deposit of at least 0.1 ether is required for a push operation to succeed. The deposit should be kept by the contract and be returned to user on pop (see point 5.)
The contract should keep the number of items in the queue and serve it via size() method.
All items in the queue should be accessible via get method. It should take the index of an item as an argument and return the tuple containing address and deposit size. Trying to get an item from an empty queue should revert. Getting an item with non-existing index should also revert.
Calling the pop method should remove an item from the front of the queue. It should be callable only by the contract owner. Upon calling the method the deposit made by the user on push should be returned to them in the exact same amount. Popping an empty queue should revert.
The following gas limits should be met:
operation	gas limit
push	75000
pop	61000
Summary:
Your task is to implement four interface methods according to the requiremens:

push() external payable
pop() external
size() external view returns(uint256)
get(uint256 _index) external view returns(address, uint256)
Keeping the function signatures as specified above is also a requirement. */



// SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract WaitingList {
    address immutable owner;

    struct Entry {
        address user;
        uint256 amount;
    }

    Entry[] private q;
    uint256 private front;

    /// @custom:selector constructor()
    constructor() {
        owner = msg.sender;
    }

    function push() external payable {
        if (msg.value < 1e17) revert(); // 0.1 ETH
        q.push(Entry(msg.sender, msg.value));
    }

    function pop() external {
        if (msg.sender != owner || front >= q.length) revert();
        (bool sent, ) = q[front].user.call{value: q[front].amount}("");
        if (!sent) revert();
        unchecked { front++; }
    }

    function size() external view returns (uint256) {
        return q.length - front;
    }

    //  Match the required signature exactly
    function get(uint256 _index) external view returns (address, uint256) {
        if (_index >= q.length - front) revert();
        Entry storage e = q[front + _index];
        return (e.user, e.amount);
    }
}
