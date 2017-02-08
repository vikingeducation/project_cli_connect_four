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
    5.downto(0) do |row|
      # display an existing marker if any, else blank
      @board[row].each do |column|
        print "| "
        column.nil? ? print("-") : print(column)
        print " |"
      end
      puts
    end

    7.times { print "|---|" }
    puts
    1.upto(7) { |i| print "| #{i} |" }
    puts
    puts
  end

# add_piece
  def add_piece(column_label, piece)
    # IF move_valid?(column)
    if move_valid?(column_label)
      # TODO - Finish add_piece method
      true
      # ELSE
      false
    end
  end

# move_valid?(column)
  def move_valid?(column_label)
    # Is the column_valid?
    # Is the column_available?
    if column_valid?(column_label) && column_available?(column_label)
      true
    else
      puts "Invalid move."
      false
    end
  end

# column_valid?(column)
  def column_valid?(column_label)
    # UNLESS column is in the acceptable range
    if column_label >= 1 && column_num <= 7
      true
    else
      # display an error message
      puts "Invalid move."
    end
  end

# column_available?(column)
  def column_available?(column_label)
    column(column_label).include?(nil) ? true : false
  end

  def column(column_label)
    column_arr = []
    @board.each_with_index do |row|
        if row[column_label - 1].nil?
          break
        else
          column_arr.push(row[column_label - 1])
        end
    end
    column_arr
  end

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