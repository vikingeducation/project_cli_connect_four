
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
    # each hash
     # loop through value
     # print each symbols hash string value
    # print the column numbers
  end

  def add_piece(column, piece)
    # check if column is not full
    # if valid
    # find the first empty spot and change to player's hash
      # true
    # else
      # false
  end

  def column_full?(column)
    # return column top empty?
  end

  def full?
    # each column
    # all full?
  end

  def winning_combination?
    winning_diagonal? ||
    winning_vertical? ||
    winning_horizontal?
  end

  def four_in_a_row?
  end

  def winning_diagonal?
    # get diagonals
    # four in a row?
  end

  def winning_vertical?
    # get verticals
    # four in a row?
  end

  def winning_horizontal?
    # get horizontals
    # four in a row?
  end

  def diagonals
    # return array of diagnols
  end

  def verticals
    # return array of vertical slots
  end

  def horizontals
    # return array of rows
  end
end