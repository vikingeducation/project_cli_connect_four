require_relative 'player'

class ComputerPlayer < Player
  def initialize(name = "Computer Player", piece, board)
    raise "Piece must be a symbol!" unless piece.is_a?(Symbol)
    @name = name
    @piece = piece
    @board = board
  end

  private

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