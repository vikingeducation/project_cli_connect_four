class Computer

  def initialize(board, piece)
    @board = board
    @piece = piece
  end

  def turn
    @board.add_piece_to_board(get_valid_column, @piece)
  end

  private

  def get_valid_column
    response = rand(7)
    until @board.does_column_have_space?(response)
      response = rand(7)
    end
    response
  end

end