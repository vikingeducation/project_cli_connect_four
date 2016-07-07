# Your code here!

#display board [BOARD]

#until game_over? [GAME]
  #player.make_move [GAME]
    #ask one player move (loop) [PLAYER]
      #if valid entry, set move to entry else, next [PLAYER]
      #valid move, add move to board else, next[BOARD]

  
    #win or board full?
  #switch player [GAME]

#display winner message or tie_message

#Game
  #play
  #game_over?(board)
  #display_winner_message
  #display_tie_message
  #switch_player


#Board
  #data: nested array where each inner array is a column
  #add to col
  #win?
  #tie?
  #col_full? (col.length > 7)

#Player  
  #make_move (calls get_move and validates and sets move = to move)
  #get_move (displays puts message and gets.chomp)
  #valid_col? (should be 1 through 7)
  #Computer
  #Human