# Pull in board and player classes
require_relative 'connect_four_board'
require_relative 'connect_four_player'

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

    loop do
      @board.render
      @current_player.get_move

      break if game_over?
      switch_player
    end
  end

  private

  def game_over?
    true
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