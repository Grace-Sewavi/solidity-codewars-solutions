// File: Day01/GrasshopperTerminalGame.sol

// Terminal game move function
// In this game, the hero moves from left to right. The player rolls the die and moves the number of spaces indicated by the die two times.

// Instruction: Create a function for the terminal game that takes the current position of the hero and the roll (1-6) and return the new position.

// Example:
// move(3, 6) should equal 15




// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function move(int p, int r) public pure returns (int) {
    // your code here
    return p + (r * 2);
  }
}