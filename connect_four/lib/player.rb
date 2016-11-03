class Player
  attr_accessor :piece
  def placement
    puts "Enter the column in which you want to place a piece"
    gets.strip.to_i - 1
  end
end
class Computer < Player
  def initialize(board)
    @board = board
  end
  def placement
    @board.close_to_win(piece) || rand(6)
  end
end