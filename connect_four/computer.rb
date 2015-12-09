class Computer

  def initialize(board, piece)
    @board = board
    @piece = piece
  end

  def turn
    @board.add_piece_to_board(response, @piece)
  end

end