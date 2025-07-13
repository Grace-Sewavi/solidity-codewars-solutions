// File: Day01/StringRepeat.sol


// Instruction: Write a function that accepts a non-negative integer n and a string s as parameters, and returns a string of s repeated exactly n times.

// Examples (input -> output)
// 6, "I"     -> "IIIIII"
// 5, "Hello" -> "HelloHelloHelloHelloHello"




// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Repeater {
  function multiply(uint8 repeat, string memory pattern) public pure returns (string memory) {
     bytes memory result;

    for (uint8 i = 0; i < repeat; i++) {
      result = abi.encodePacked(result, pattern);
    }
    
    return string(result);
  }
}