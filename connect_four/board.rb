class Board

  def initialize
    @board = {}

  end

  def setup
    (1..6) do |key|
      @board[key] = ["0", "0", "0", "0", "0", "0", "0"]
    end
  end

  def render
    @board.each do |key, value|
      puts value
    end
  end
end