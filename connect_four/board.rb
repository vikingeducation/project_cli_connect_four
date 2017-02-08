# Maintains game board state
class Board
# initialize board
  def initialize
    # set up blank data structure
    @board = Array.new(6) { Array.new(7) }
  end

# render
  def render
    puts
    # loop through data structure
    @board.each do |row|
      # display an existing marker if any, else blank
      row.each do |slot|
        print " "
        slot.nil? ? print("-") : print(slot)
        print " "
      end
      puts
    end
    puts
  end

# add_piece
  def add_piece(column, piece)
    # IF move_valid?(column)
    if move_valid?(column)
      # TODO - Finish add_piece method
      true
      # ELSE
      false
    end
  end

# move_valid?(column)
  def move_valid?(column)
    # Is the column_valid?
    # Is the column_available?
    if column_valid?(column) && column_available?(column)
      true
    else
      puts "Invalid move."
      false
    end
  end

# column_valid?(column)
  def column_valid?(column)
    # UNLESS column is in the acceptable range
    if column >= 1 && column <= 7
      true
    else
      # display an error message
      puts "Invalid move."
    end
  end

# column_available?(column)
# UNLESS column is not full
# display error message

# winning_combination?
# is there a winning_diagonal?
# or winning_vertical?
# or winning_horizontal? for that piece?

# winning_diagonal?
# check if specified piece has four in a row across diagonals

# winning_vertical?
# check if specified piece has four in a row across verticals

# winning_horizontal?
# check if specified piece has four in a row across horizontals

# diagonals
# return the diagonal pieces

# verticals
# return the vertical pieces

# horizontals
# return the horizontal pieces

# full?
# does every slot contain a piece?
end