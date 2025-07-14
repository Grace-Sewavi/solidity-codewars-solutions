// File: Day02/CenturyFromYear.sol

// Instruction: The first century spans from the year 1 up to and including the year 100, the second century - from the year 101 up to and including the year 200, etc.

// Task
// Given a year, return the century it is in.

// Examples
// 1705 --> 18
// 1900 --> 19
// 1601 --> 17
// 2000 --> 20
// 2742 --> 28
// Note: this kata uses strict construction as shown in the description and the examples, you can read more about it here



// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function century(int year) public pure returns (int) {
    // your code here
    require(year > 0, "year must be greater than zero");
    
    return (year + 99) / 100;
  }
}