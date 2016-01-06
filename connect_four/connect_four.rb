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
    set_symbol
  end

  def set_symbol
    @turn.choose_symbol
    @turn.symbol == 'x' ? @player2.symbol = 'o' : @player2.symbol = 'x'
  end

  def play
    until @win?
    	@turn.choose_column
      check_game_over
      switch_players
    end

  end


  def switch_players
    if @turn == @player1
      @turn = @player2
    else
      @turn = @player1
    end
  end

  def check_game_over
  end

  # check if winning combination exists
  def check_victory
    if winning_combination?
      winner = @turn
    elsif player2 wins?
    else
      draw
    end
  end

  def check_draw
  end
  
end

game = ConnectFour.new
game.board.to_s

