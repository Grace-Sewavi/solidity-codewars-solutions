// File: Day_03/RomanNumeralsEncoder.sol


/* Instruction: Create a function taking a positive integer between 1 and 3999 (both included) as its parameter and returning a string containing the Roman Numeral representation of that integer.

Modern Roman numerals are written by expressing each digit separately starting with the leftmost digit and skipping any digit with a value of zero. There cannot be more than 3 identical symbols in a row.

In Roman numerals:

1990 is rendered: 1000=M + 900=CM + 90=XC; resulting in MCMXC.
2008 is written as 2000=MM, 8=VIII; or MMVIII.
1666 uses each Roman symbol in descending order: MDCLXVI.
Example:

   1 -->       "I"
1000 -->       "M"
1666 --> "MDCLXVI"
Help:

Symbol    Value
I          1
V          5
X          10
L          50
C          100
D          500
M          1,000 */




// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract Kata {
  function solution(uint n) public pure returns (string memory) {
    // Convert the positive integer to a Roman Numeral
   require(n >= 1 && n <= 3999, "Input must be between 1 and 3999");

    string[13] memory symbols = [
      "M", "CM", "D", "CD", "C", "XC", "L",
      "XL", "X", "IX", "V", "IV", "I"
    ];

    uint256[13] memory values = [
      uint256(1000), uint256(900), uint256(500), uint256(400),
      uint256(100), uint256(90), uint256(50), uint256(40),
      uint256(10), uint256(9), uint256(5), uint256(4), uint256(1)
    ];

    string memory result;
    for (uint256 i = 0; i < values.length; i++) {
      while (n >= values[i]) {
        result = string(abi.encodePacked(result, symbols[i]));
        n -= values[i];
      }
    }

    return result;
  }
}