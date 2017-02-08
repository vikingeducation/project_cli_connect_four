# Controls the game play
class ConnectFour
# initialize
  # set up the board
  # set up the players
  # assign the starting player

# play
  # loop infinitely
    # call the board rendering method
    # ask for coordinates from the current player
    # break the loop IF the game is over
    # switch players

# check_game_over
  # check_victory
  # check_draw

# check_victory
  # IF board says current player's piece has
  # a winning_combination?
  # display a victory message

# check_draw
  # IF board says it's full
  # display a draw message

# switch_players
  # PlayerX >> PlayerO or vice versa
end