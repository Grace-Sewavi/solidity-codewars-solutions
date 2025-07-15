// File: Day_03/TicTacToeChecker.sol



/* Instruction: If we were to set up a Tic-Tac-Toe game, we would want to know whether the board's current state is solved, wouldn't we? Our goal is to create a function that will check that for us!

Assume that the board comes in the form of a 3x3 array, where the value is 0 if a spot is empty, 1 if it is an "X", or 2 if it is an "O", like so:

[[0, 0, 1],
 [0, 1, 2],
 [2, 1, 0]]
We want our function to return:

-1 if the board is not yet finished AND no one has won yet (there are empty spots),
1 if "X" won,
2 if "O" won,
0 if it's a cat's game (i.e. a draw).
You may assume that the board passed in is valid in the context of a game of Tic-Tac-Toe. */



// SPDX-License-Identifier: BSD-2-Clause
pragma solidity ^0.8.16;

contract TicTacToe {
  function isSolved(int[3][] memory m) public pure returns (int) {
    // TODO: Check if the board is solved
     // Check rows and columns
    for (uint i = 0; i < 3; i++) {
      // Rows
      if (m[i][0] != 0 && m[i][0] == m[i][1] && m[i][1] == m[i][2]) {
        return m[i][0];
      }
      // Columns
      if (m[0][i] != 0 && m[0][i] == m[1][i] && m[1][i] == m[2][i]) {
        return m[0][i];
      }
    }

    // Check diagonals
    if (m[0][0] != 0 && m[0][0] == m[1][1] && m[1][1] == m[2][2]) {
      return m[0][0];
    }

    if (m[0][2] != 0 && m[0][2] == m[1][1] && m[1][1] == m[2][0]) {
      return m[0][2];
    }

    // Check for empty cells (game not finished)
    for (uint i = 0; i < 3; i++) {
      for (uint j = 0; j < 3; j++) {
        if (m[i][j] == 0) {
          return -1;
        }
      }
    }

    // No winner, board full = draw
    return 0;
  }
}