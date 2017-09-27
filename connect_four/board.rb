class Board
  attr_accessor :board, :red_piece, :black_piece

  def initialize
    @board = [['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-']]
  end

  def display_board
    board.each do |row|
      row.each { |space| print space}
      print "\n"
    end
  end
end

Board.new.display_board