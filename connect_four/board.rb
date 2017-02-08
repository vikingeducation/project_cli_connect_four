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
    diagonals.each do |diagonal|
      consecutive_pieces = 0
      diagonal.each do |slot|
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

# winning_vertical_available?(piece)
  def winning_vertical_available?(piece)
    verticals.each do |column|
      consecutive_pieces = 0
      column.each do |slot|
        if slot == piece
          consecutive_pieces += 1
        elsif slot == nil && consecutive_pieces == 3
          return true
        end
      end
    end
    false
  end

# winning_horizontal?
  def winning_horizontal?(piece)
    horizontals.each do |row|
      consecutive_pieces = 0
      row.each do |slot|
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

# diagonals
  def diagonals
    # return the diagonal pieces
    diagonals_arr = []

    # column constant at 0, row increasing by 1
    3.times do |i|
      column_start = 0
      row_start = 0
      row_start += i
      column = column_start
      row = row_start
      diagonal = []

      while column <= 6 && row <= 5
        diagonal.push(@board[row][column])
        column += 1
        row += 1
      end

      diagonals_arr.push(diagonal)
    end

    # row constant at 0, column increasing by 1
    3.times do |i|
      column_start = 1
      row_start = 0
      column_start += i
      column = column_start
      row = row_start
      diagonal = []

      while column <= 6 && row <= 5
        diagonal.push(@board[row][column])
        column += 1
        row += 1
      end

      diagonals_arr.push(diagonal)
    end

    # column constant at 6, row increasing by 1
    3.times do |i|
      column_start = 6
      row_start = 0
      row_start += i
      column = column_start
      row = row_start
      diagonal = []

      while column >= 0 && row <= 5
        diagonal.push(@board[row][column])
        column -= 1
        row += 1
      end

      diagonals_arr.push(diagonal)
    end

    # row constant at 0, column decreasing by 1
    3.times do |i|
      column_start = 5
      row_start = 0
      column_start -= i
      column = column_start
      row = row_start
      diagonal = []

      while column >= 0 && row <= 5
        diagonal.push(@board[row][column])
        column -= 1
        row += 1
      end

      diagonals_arr.push(diagonal)
    end

    diagonals_arr
  end

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
    @board.each do |row|
      row.each do |slot|
        return false if slot.nil?
      end
    end

    true
  end
end