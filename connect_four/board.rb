
#Pseudocode
  # Set up the game initially 
  #     Create a game board
  #     Create Players(2)
  # Start the game loop
  #     Render the board
  #     Ask for and validate current player move
  #     Update board 
  #     Check for game over conditions
  #       if the game should end 
  #         Display the proper victory/loss message
  #         break looping
  #       else
  #           Switch to the ne[_]t player and keep looping

  # Classes:
  #     1. Game (itself)
  #     2. Player 
  #         2.5.  Human < Player
  #         2.6.  Computer < Player
  #     3. Board

#board.rb
class Board

 #   [_] [_] [_] [_] [_] [_] [_]  
 #   [_] [_] [_] [_] [_] [_] [_] 
 #   [_] [_] [_] [_] [_] [_] [_] 
 #   [_] [_] [_] [_] [_] [_] [_] 
 #   [o] [_] [_] [_] [_] [_] [_] 
 #   [o] [_] [_] [_] [_] [_] [_] 
 #    1   2   3   4   5   6   7    

#data = {  1 => [ :o, :o, :clear ,  :clear,  _ , _  ] ,  2 => [].... }

  def initialize
    @render_hash = { :o => "[o]", :x => "[x]", :clear => "[_]" }
    #set up data structure
    # set up hash for player pieces (which_user: string_visual )
    # set up a hash (keys: 1-7) to contain arrays
    # assign 7 arrays of length 6 into hash
    #   fill the array with key:value ( clear => [_] )
   
  end

  def render
    # loop through data structure
    #set up an empty board
  end

  def add_piece

  end

  def piece_location_valid?
  end

  def full?
  end

  def winning_combination?
  end

  def winning_diagonal?
  end

  def winning_vertical?
  end

  def winning_horizontal?
  end

  def diagonals
  end

  def verticals
  end

  def horizontals
  end
end