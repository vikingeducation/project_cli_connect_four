# Pull in board and player classes
require_relative 'connect_four_board'
require_relative 'connect_four_player'

class ConnectFour

  def initialize
    @board = Board.new

    welcome_message

    @player1 = Player.new(@board)
    @player2 = Player.new(@board)

    start
  end

  private

  def start
    @board.render
  end

  def welcome_message
    puts "**************************************"
    puts "***    Welcome to Connect Four!    ***"
    puts "**************************************\n\n"
  end
end

game = ConnectFour.new