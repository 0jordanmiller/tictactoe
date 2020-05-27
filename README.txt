How the game will work:
Start the game, Player 1 inputs a1, a2, a3, b1 etc. Player 2 goes next. If input is invalid, output invalid input, try again.
If the game is a tie, out put tie
Whichever player reaches 3 in a row first wins, option to restart is given.



Pseudocode:
Start the code, create 9 instances of the square. Each square has a hash with values x, y, checked_by
To mark a space, prompt player to input a1, b2, etc. Input will be parsed, first value will be matched with x, second value with y.
if checked_by is not nil, return invalid input

After 5th turn, code will check for a winner. If winner is found, prompt to restart
If all 9 instances of checked_by are not nil, and no winner is found, declare a tie

