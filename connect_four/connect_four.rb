require_relative 'board'
require_relative 'human'

class ConnectFour

  def initialize
    @board = Board.new
    @human = Human.new
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
  end

end

ConnectFour.new.game_intro