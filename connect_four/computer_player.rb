class ComputerPlayer < Player
  # initialize
  def initialize(name = "Computer Player", piece, board)
    # Set marker type (e.g. X or O)
    raise "Piece must be a symbol!" unless piece.is_a?(Symbol)
    @name = name
    @piece = piece
    @board = board
  end

  # ask_for_column
  def ask_for_column
    if @board.winning_vertical_available?(piece)
      @board.winning_vertical_move(piece) + 1
    elsif @board.winning_horizontal_available?(piece)
      @board.winning_horizontal_move(piece) + 1
    else
      rand(6) + 1
    end
  end
end