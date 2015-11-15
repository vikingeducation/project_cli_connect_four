# Pull in deep_dup module
require_relative 'deep_dup'

# Pull in board and player classes
require_relative 'board'
require_relative 'player'
require_relative 'human'
require_relative 'computer'

require 'pry'

class ConnectFour

  def initialize(mode=nil)
    welcome_message

    @board = Board.new
    mode = mode || get_mode
    @player1 = Human.new(@board, "x")

    if mode == 2
      @player2 = Human.new(@board, "o")
    else
      @player2 = Computer.new(@board, "o")
    end

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

  def get_mode
    puts "Enter 1 to play against the computer or 2 to play with another human."
    gets.chomp.to_i
  end

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

# game = ConnectFour.new
# game.play