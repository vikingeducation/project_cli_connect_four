require_relative "player"
require_relative "board"
require_relative "render"

class ConnectFour
  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
    @player1.piece = "X"
    @player2.piece = "O"
    play
  end

  def play
    @board.add_piece(@player1.placement, @player1.piece)
    Render.board(@board.board)
  end
end

ConnectFour.new