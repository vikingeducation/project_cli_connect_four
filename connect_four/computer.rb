require_relative 'board.rb'

class Computer < Player

  def initialize
    @board = Board.new
  end

  def select_move
    (1..7).to_a.sample
  end

  

end