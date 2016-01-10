require_relative 'board.rb'
require_relative 'player.rb'

class Computer < Player

  attr_accessor :board

  def initialize(color)
    super
    @board = Board.new
  end

  def select_move
    find_horizontal_win || (1..7).to_a.sample
  end

  def find_horizontal_win
    @board.board.each do |row|
      if @board.check_three?(row)
        column = @board.check_three?(row)
        return column
      end
    end
    false
  end

end