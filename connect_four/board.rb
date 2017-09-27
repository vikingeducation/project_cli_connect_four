class Board
  attr_accessor :board, :red_piece, :black_piece

  def initialize
    @board = [['1', '2', '3', '4', '5', '6', '7'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', '-', '-', '-', '-', '-'],
              ['-', '-', 'X', '-', '-', '-', '-']]
  end

  def display_board
    board.each do |row|
      row.each { |space| print space}
      print "\n"
    end
  end

  def update_board(column)
    row = 1
    while self.board[row][column - 1] == '-' && row < 7
      row += 1
    end
    puts row
    if row == 7
      self.board[6][column - 1] = 'X'
    else
      self.board[row - 1][column - 1] = 'X'
    end
  end
end

a = Board.new

a.update_board(3)
a.display_board