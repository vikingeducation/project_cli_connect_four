## Pseudocoding Connect Four

### Program flow
```
Setup the game
  Create the game grid
  Check whether game is two-player or single-player
  If game is two-player
    Create two human players
    Assign game token to each player
  Else
    Create a human player
    Create a computer player
    Assign game token to each player

Run the game
  Display game grid
  Player One selects which column to place his token in
  Check if that move is valid
  If move is valid
    Make the move
  Else
    Display error message
    Prompt player for move again
  Update game grid
  Display game grid
  Check if victory has been achieved
  If victory has been achieved
    Display winning message, congratulate winner
    Exit game
  Check if all spaces in the grid have been filled
  If all spaces are filled
    Declare a tie
    Exit game
  
  Switch players
  Repeat until one player wins or game ties
```