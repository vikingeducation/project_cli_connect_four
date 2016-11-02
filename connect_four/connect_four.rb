
class ConnectFour

  def initialize(args = {})
    @player_1, @player_2 = args[:players] || [HumanPlayer.new(piece: :x),
                                              HumanPlayer.new(piece: :o)]
    @board = args[:board]                 || Board.new
  end

  

end
