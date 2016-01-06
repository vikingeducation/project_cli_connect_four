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

  def four_horizontal?
    @board.each do |row_number, row|
      # byebug
      if check_four?(row)
        return true
      end
    end
    return false
  end

  def check_vertical?(column)
    column_array = []

    @board.each do |row_number, row|
      #byebug
      column_array << row[column]
      if check_four?(column_array)
        return true
      end
    end
    return false
  end

  def check_four?(array)
    check_string = array.join("")
    if check_string.include?("RRRR") || check_string.include?("BBBB")
      return true
    end
    return false
  end

  def check_diagonal_upper_right(row, column)
    check_array = [@board[row][column]]
    temp_row = row
    temp_column = column

    5.times do

      temp_row -= 1
      temp_column += 1

      unless temp_row < 1 || temp_column > 6
        check_array << @board[temp_row][temp_column]
      else
        return check_array
      end

    end
  end

  def check_diagonal_lower_left(row, column)
    check_array = []
    temp_row = row
    temp_column = column

    5.times do 
      temp_row += 1
      temp_column -= 1

      unless temp_row > 6 || temp_column < 0
        check_array << @board[temp_row][temp_column]
      else
        return check_array.reverse
      end      
    end    

  end

  def check_diagonal_upper_left(row, column)
    check_array = [@board[row][column]]
    temp_row = row
    temp_column = column

    5.times do

      temp_row -= 1
      temp_column -= 1

      unless temp_row < 1 || temp_column < 0
        check_array << @board[temp_row][temp_column]
      else
        return check_array.reverse
      end

    end
  end

  def check_diagonal_lower_right(row, column)
    check_array = []
    temp_row = row
    temp_column = column

    5.times do 
      temp_row += 1
      temp_column += 1

      unless temp_row > 6 || temp_column > 6
        check_array << @board[temp_row][temp_column]
      else
        return check_array
      end      
    end    

  end

  def get_diagonal_right(row, column)
    diagnoal_right = check_diagonal_lower_left + check_diagonal_upper_right
  end

  def get_diagonal_left(row, column)
    diagonal_left = check_diagonal_upper_left + check_diagonal_lower_right
  end

  def four_diagonal?(row, column)
    check_four?(get_diagonal_right(row, column)) || check_four?(get_diagonal_left(row,column))
  end

  def four_vertical?
    6.downto(0).to_a.each do |column|
      if check_vertical?(column)
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

