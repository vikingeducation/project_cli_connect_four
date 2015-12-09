require_relative 'board'
require_relative 'board'
require_relative 'human'


class ConnectFour

  def initialize
    @board = Board.new
    @player1 = Human.new(@board, "X")
    @player2 = Human.new(@board, "O")
  end

  def game_intro
    puts "CONNECT FOUR"
    puts "------------"
    puts "by Steven Chang"
    puts ""
    puts "Connect four is a two-player connection game in which the players take turns dropping colored discs from the top into a seven-column, six-row vertically suspended grid."
    puts ""
    puts "The pieces fall straight down, occupying the next available space within the column. The objective of the game is to connect four of one's own discs next to each other vertically, horizontally, or diagonally before your opponent."
    puts ""
    start_game
  end

  private

  def start_game
    @board.render
    loop do
      print "Player 1 - "
      @player1.turn
      puts ""
      @board.render
      print "Player 2 - "
      @player2.turn
      puts ""
      @board.render
    end
  end

end

ConnectFour.new.game_intro