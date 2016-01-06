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
    puts "Column full"
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
    #check for horizontal win
  end

  def four_vertical?
    #check for vertical win
  end

  def four_diagonal?
    #check for diagnol win
  end

  def draw?
    !win? && board_full?
  end

  def win?
    four_diagonal? || four_vertical? || four_horizontal?   
  end

end

