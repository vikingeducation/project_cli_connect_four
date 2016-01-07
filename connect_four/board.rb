class Board
  attr_accessor :board
  
  def initialize
    @board = {}
  end

  def setup
    (1..6).each do |key|
      @board[key] = ["0", "0", "0", "0", "0", "0", "0"]
    end
    return nil
  end

  def test_right
    @board[1] = ["0", "0", "0", "0", "0", "0", "0"]
    @board[2] = ["0", "0", "0", "0", "0", "0", "0"]
    @board[3] = ["0", "0", "0", "0", "0", "0", "0"]
    @board[4] = ["0", "0", "R", "B", "0", "0", "0"]
    @board[5] = ["0", "R", "B", "B", "0", "0", "0"]
    @board[6] = ["R", "B", "B", "B", "0", "0", "0"]
  end

  def test_left
    @board[1] = ["0", "0", "0", "0", "0", "0", "0"]
    @board[2] = ["0", "0", "0", "0", "0", "0", "0"]
    @board[3] = ["0", "0", "0", "0", "0", "0", "0"].reverse
    @board[4] = ["0", "0", "R", "B", "0", "0", "0"].reverse
    @board[5] = ["0", "R", "B", "B", "0", "0", "0"].reverse
    @board[6] = ["R", "B", "B", "B", "0", "0", "0"].reverse   
  end

  def test_draw
    (1..6).each do |key|
      @board[key] = ["T", "T", "T", "T", "T", "T", "T"]
    end
    return nil
  end

  def test_horizontal_ai
    @board[1] = ["0", "0", "0", "0", "0", "0", "0"]
    @board[2] = ["0", "0", "0", "0", "0", "0", "0"]
    @board[3] = ["0", "0", "0", "0", "0", "0", "0"]
    @board[4] = ["0", "0", "R", "B", "0", "0", "0"]
    @board[5] = ["0", "R", "B", "B", "0", "0", "0"]
    @board[6] = ["R", "B", "B", "B", "0", "0", "0"]
  end

  def render
    @board.each do |key, value|
      print "#{value}\n"
    end
  end

  def column_full?(column)
    @board.each do |row_number, row|
      if row[column - 1] == "0"
        return false
      end
    end
    true
  end

  def board_full?
    (1..7).to_a.each do |column|
      unless column_full?(column)
        return false
      end
    end
  end

  def position_empty?(position)
    position == "0" ? true : false
  end

  # Checks if a specific column has a win.
  def check_vertical?(column)
    column_array = []

    @board.each do |row_number, row|
      column_array << row[column]
      if check_four?(column_array)
        return true
      end
    end
    return false
  end

  # Checks any array for 4 in a row.
  def check_four?(array)
    check_string = array.join("")
    if check_string.include?("RRRR") || check_string.include?("BBBB")
      return true
    end
    return false
  end

  # Checks for 3 in a row so computer can see possible wins
  def check_three?(array)
    zero_index = nil   
    win_conditions = ["RRR0", "0RRR", "BBB0", "0BBB"]
    check_string = array.join("")
    win_conditions.each_with_index do |win_string, index|
      if check_string.include?(win_string)
        if index.even?
          zero_index = check_string.index(win_string) + 3
        else
          zero_index = check_string.index(win_string)
        end
        return zero_index
      end
    end
    false
  end

  # This returns the values to the upper right of the move coordinates.
  def check_diagonal_upper_right(row, column)
    check_array = [@board[row][column - 1]]
    temp_row = row
    temp_column = column - 1

    5.times do

      temp_row -= 1
      temp_column += 1

      if temp_row < 1 || temp_column > 6
        return check_array
      else
        check_array << @board[temp_row][temp_column]
      end

    end
    check_array
  end

  # This returns the values to the lower left of the move coordinates.
  def check_diagonal_lower_left(row, column)
    check_array = []
    temp_row = row
    temp_column = column - 1

    5.times do 
      temp_row += 1
      temp_column -= 1

      if temp_row > 6 || temp_column < 0
        return check_array.reverse
      else
        check_array << @board[temp_row][temp_column]
      end      
    end    
    check_array
  end

  # This returns the values to the upper left of the move coordinates.
  def check_diagonal_upper_left(row, column)
    check_array = [@board[row][column - 1]]
    temp_row = row
    temp_column = column - 1

    5.times do

      temp_row -= 1
      temp_column -= 1

      if temp_row < 1 || temp_column < 0
        return check_array.reverse
      else
        check_array << @board[temp_row][temp_column]
      end

    end
    check_array
  end

  # This returns the values to the lower right of the move coordinates.
  def check_diagonal_lower_right(row, column)
    check_array = []
    temp_row = row
    temp_column = column - 1

    5.times do 
      temp_row += 1
      temp_column += 1

      if temp_row > 6 || temp_column > 6
        return check_array
      else
        check_array << @board[temp_row][temp_column]
      end      
    end    
    check_array
  end

  # Stitches together the full right diagonal.
  def get_diagonal_right(row, column)
    diagonal_right = check_diagonal_lower_left(row, column) + check_diagonal_upper_right(row, column)
  end

  # Stitches together the full left diagonal.
  def get_diagonal_left(row, column)
    diagonal_left = check_diagonal_upper_left(row, column) + check_diagonal_lower_right(row, column)
  end

  # Checks both diagonals for a win
  def four_diagonal?(row, column)
    check_four?(get_diagonal_right(row, column)) || check_four?(get_diagonal_left(row,column))
  end

  # Checks all columns for a vertical win
  def four_vertical?
    6.downto(0).to_a.each do |column|
      if check_vertical?(column)
        return true
      end
    end
    return false
  end

  # Checks all rows for a horizontal win
  def four_horizontal?
    @board.each do |row_number, row|
      # byebug
      if check_four?(row)
        return true
      end
    end
    return false
  end

  def draw?(row, column)
    !win?(row, column) && board_full?
  end

  def win?(row, column)
    four_diagonal?(row, column) || four_vertical? || four_horizontal?   
  end

end

