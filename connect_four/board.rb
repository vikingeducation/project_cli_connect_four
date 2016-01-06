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
    #check for diagnol win
  end

  def four_vertical?
    6.downto(0).to_a.each do |column|
      if check_vertical?(column)
        return true
      end
    end
    return false
  end

  def draw?
    !win? && board_full?
  end

  def win?
    four_diagonal? || four_vertical? || four_horizontal?   
  end

end

