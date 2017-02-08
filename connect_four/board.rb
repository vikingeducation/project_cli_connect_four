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
    # IF piece_location_valid?
      # place piece
    # ELSE
      # display error message

# move_valid?
  # Is the placement valid_column?
  # Is the piece column_available?

# valid_column?
  # UNLESS column is in the acceptable range
    # display an error message

# columns_available?
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