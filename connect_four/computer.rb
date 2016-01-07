require_relative 'board.rb'

class Computer < Player

  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def select_move
    (1..7).to_a.sample
  end

  def find_horizonal_win(board)
    brd.check_three?()
  end

end