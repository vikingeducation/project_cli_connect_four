class Board
  def initialize
    @board = Array.new(7) { [] }
  end

  def add_piece(column, piece)
    @board[column]  << piece if @board[column].length < 7
  end
end