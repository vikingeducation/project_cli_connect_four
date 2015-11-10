# Pull in board and player classes
require_relative 'connect_four_board'
require_relative 'connect_four_player'

require 'pry'

class ConnectFour

  def initialize
    @board = Board.new

    welcome_message

    @player1 = Player.new(@board, "x")
    @player2 = Player.new(@board, "o")
    @current_player = @player1
  end

  def play
    give_instructions
    @board.render

    loop do
      @current_player.get_move
      @board.render

      break if game_over?
      switch_player
    end
  end

  private

  def game_over?
    win? || draw?
  end

  def win?
    if @board.winning_combination?(@current_player.symbol)
      puts "Congratulations, #{@current_player.name}! You WON!!"
      true
    else
      false
    end
  end

  def draw?
    if @board.full?
      puts "Game over.  Looks like it's a draw.  :("
      true
    else
      false
    end
  end

  def switch_player
    @current_player == @player1 ? @current_player = @player2 : @current_player = @player1
  end

  def welcome_message
    puts "**************************************"
    puts "***    Welcome to Connect Four!    ***"
    puts "**************************************\n\n"
  end

  def give_instructions
    puts "\nINSTRUCTIONS:"
    puts "On your turn, enter the column number where you would like to place your game piece."
  end
end

game = ConnectFour.new
game.play