class Board

  def initialize
    @board = {}

  end

  def setup
    (1..6).each do |key|
      @board[key] = ["0", "0", "0", "0", "0", "0", "0"]
    end
  end

  def render
    @board.each do |key, value|
      print "#{value}\n"
    end
  end

  def column_full?
    #checks if column is full, return true/false
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

  def win?
    four_diagonal || four_vertical || four_horizontal   
  end

end

b = Board.new
b.setup
b.render