require_relative "./board.rb"
require_relative "./player.rb"

class ConnectFour
	attr_accessor :board

  def initialize
    @board = Board.new
    @player1 = Player.new
    @player2 = Player.new
    @turn = @player1
    @game_status = false
    set_symbol
  end

  def set_symbol
    @turn.choose_symbol
    @player1.symbol == :X ? @player2.symbol = :O : @player2.symbol = :X
  end

  def play
    # until @game_status?
    # 	@turn.choose_column
    #   check_game_over
    #   switch_players
    # end
    puts "player1 symbol is #{@player1.symbol}"
    puts "player2 symbol is #{@player2.symbol}"
  end


  def switch_players
    if @turn == @player1
      @turn = @player2
    else
      @turn = @player1
    end
  end

  def check_game_over
    check_victory
    check_draw
  end

  # check if winning combination exists
  def check_victory
    if winning_combination?
      winner = @turn
      puts "You won #{winner}!"
      @game_status = true
    end
  end

  def check_draw
    if @board.full?
      puts "It's a draw."
    end
    @game_status = true
  end
  
end

game = ConnectFour.new
game.play

