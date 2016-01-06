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

  def four_diagonal?
    
  end

  def check_diagonal_right(row, column)

  end

  def get_diagonal_right(row, column)
    column_range = (0..6).to_a
    row_range = (0..5).to_a
    diagonal_array = []

    
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

