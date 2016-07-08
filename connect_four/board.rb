# Pseudocode
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
    @NUM_ROWS = 6
    @NUM_COLS = 7
    #set up data structure
    @game_board = {}
    create_board_structure
    # set up a hash (keys: 1-7) to contain arrays
    # assign 7 arrays of length 6 into hash
    #   fill the array with key:value ( clear => [_] )
  end

  def render
    render_hash = { :o => "[o]", :x => "[x]", :clear => "[_]" }
    # loop through data structure
    @NUM_ROWS.downto(1) do |row|
      @NUM_COLS.times do |col|
        print "#{render_hash[ @game_board[col + 1][row - 1] ]} "
      end
      puts
    end

    @NUM_COLS.times { |col| print " #{col + 1}  " }
    puts
  end

  def add_piece(column, piece)
    return false if column_full?(column)

    row = nil

    @game_board[column].each_index do |index|
      row ||= index if @game_board[column][index] == :clear  
    end
    
    @game_board[column][row] = piece
    true
  end

  def column_full?(column)
    @game_board[column][-1] != :clear
  end

  def full?
    @NUM_COLS.times do |col|
      return false unless column_full?(col + 1)
    end

    true
  end

  def winning_combination?
    four_in_a_row?(diagonals) ||
    four_in_a_row?(verticals) ||
    four_in_a_row?(horizontals)
  end
# [ [:o, :x, :o, :x, :x, :x, :x] ]
  def four_in_a_row?(sequences)
    sequences.each do |sequence|
      count = 0
      current_piece = sequence[0]
      sequence.each_index do |index|
#skip first iteration
        next if index == 0
# check for sequence of four
        if current_piece == sequence[index]
          count += 1
        else 
          current_piece = sequence[index]
          count = 0
        end
        return true if count == 3
      end
    end
    false
  end

  def diagonals
    diagonals_array = []
    
    #first half diagonal
    @NUM_COLS.times do |col_num|
        count = 0
        diag = []
        until col_num + count >= @NUM_COLS || count >= @NUM_ROWS
          diag << @game_board[col_num + count + 1][count]
          count += 1
        end 
        diagonals_array << diag
    end
    #second half diagonal
    (@NUM_ROWS - 1).times do |row_num|
      count = 0
      diag = []
      until row_num + count >= @NUM_ROWS || count + 1 >= @NUM_COLS
          diag << @game_board[count + 1][row_num + count]
          count += 1
        end 
        diagonals_array << diag
    end

    diagonals_array
  end

  def verticals
    verticals_array = []
    @NUM_COLS.times do |col|
      verticals_array << @game_board[col+1]
    end
    verticals_array
  end

  def horizontals
    horizontals_array = []
    @NUM_ROWS.downto(1) do |row|
      row_array = []
      @NUM_COLS.times do |col|
        row_array << @game_board[col + 1][row - 1]
      end
      horizontals_array << row_array
    end
    horizontals_array
  end

  def create_board_structure
    7.times do |count|
      @game_board[count + 1] = Array.new(6, :clear)
    end
  end
end

