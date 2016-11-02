
class ConnectFour

  def initialize(args = {})
    @board = args[:board]                 || Board.new
    @name = "Connect Four"
    @player_1, @player_2 = args[:players] || [HumanPlayer.new(piece: :x),
                                              HumanPlayer.new(piece: :o)]
  end

  def instructions
    "\nThe board is a 6 x 7 grid.\n
    Each turn you will add one piece to a column\n
    The first player to connect four (horizontally, vertically,\n
    or diagonally) wins\n"
  end

end
