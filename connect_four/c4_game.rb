class ConnectFourGame
  attr_accessor :game_board
  def initialize
    @game_board = ConnectFourBoard.new
  end

  def self.start
    play
  end

  def play
    game_board.render
  end
end
