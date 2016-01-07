require_relative 'board.rb'

class Computer < Player

  attr_accessor :board

  def initialize(color)
    super
    @board = Board.new
  end

  def select_move
    if find_horizontal_win
      find_horizontal_win
    else
      (1..7).to_a.sample
    end
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