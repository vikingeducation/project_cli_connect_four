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
    column_index = column_label - 1

    # IF move_valid?(column)
    if move_valid?(column_label)
      @board.each_with_index do |row, i|
        if row[column_index].nil?
          #place piece
          @board[i][column_index] = piece
          return true
        end
      end
    else
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
    if column_label >= 1 && column_label <= 7
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

    @board.each do |row|
      column_arr.push(row[column_label - 1])
    end

    column_arr
  end

# winning_combination?(piece)
  def winning_combination?(piece)
# is there a winning_diagonal?
# or winning_vertical?
# or winning_horizontal? for that piece?
    winning_diagonal?(piece) || winning_vertical?(piece) || winning_horizontal?(piece)
  end

# winning_diagonal?
  def winning_diagonal?(piece)
# TODO - check if specified piece has four in a row across diagonals
    false
  end


# winning_vertical?
  def winning_vertical?(piece)
    verticals.each do |column|
      consecutive_pieces = 0
      column.each do |slot|
        if slot == piece
          consecutive_pieces += 1
          return true if consecutive_pieces == 4
        else
          consecutive_pieces = 0
        end
      end
    end

    false
  end

# winning_horizontal?
  def winning_horizontal?(piece)
    # TODO - check if specified piece has four in a row across horizontals
    false
  end

# diagonals
# return the diagonal pieces

# verticals
  def verticals
    columns = []

    1.upto(7) do |column_label|
      columns.push(column(column_label))
    end

    columns
  end

# horizontals
  def horizontals
# return the horizontal rows
    @board
  end

# full?
  def full?
    # TODO - does every slot contain a piece?
    false
  end
end