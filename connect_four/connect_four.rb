require_relative "./board.rb"
require_relative "./player.rb"

class ConnectFour
	attr_accessor :board

  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
  end

  def play
  	@player1.choose_color
  	@player1.color == 'red' ? @player2.color = 'black' : @player2.color = 'red'
  	choose_column
  end

  
end

game = ConnectFour.new
game.board.to_s

