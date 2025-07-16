// File: Day_04/ThirdAngleOfATriangle.sol

/* Instruction: You are given two interior angles (in degrees) of a triangle.

Write a function to return the 3rd.

Note: only positive integers will be tested.*/



// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract ThirdAngle {
  function otherAngle(int angle1, int angle2) public pure returns (int) {
    return 180 - (angle1 + angle2);
  }
}
