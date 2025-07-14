// File: Day_02/SumOfAngles.sol

// Instruction: Find the total sum of internal angles (in degrees) in an n-sided simple polygon. 
// N will be greater than 2.



// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function angle(int n) public pure returns (int) {
    // your code here
     return (n - 2) * 180;
  }
}