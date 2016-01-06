require_relative "./board.rb"
require_relative "./player.rb"

class ConnectFour
	attr_accessor :board

  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
    @turn = @player1
    @win? = false
  end

  def play
    until @win?

    	@player1.choose_color
    	@player1.color == 'x' ? @player2.color = 'o' : @player2.color = 'x'
    	@player1.choose_column


      if @turn == @player1
        @turn = @player2
      else
        @turn = @player1
      end
    end

  end

  # check if winning combination exists
  def check_win
    
  end
  
end

game = ConnectFour.new
game.board.to_s

