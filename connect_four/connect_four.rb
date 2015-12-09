require_relative 'board'
require_relative 'board'
require_relative 'human'


class ConnectFour

  def initialize
    @board = Board.new
    @player_one = Human.new(@board, "X")
    @player_two = Human.new(@board, "O")
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
    round = 1
    # It should keep looping until the number of turns is finished or if there's a break because someone as won.
    # The thing is the game needs to know if the loop is over, if it's over because somebody won or if it ran out of goes and nobody won.
    # Could have it set that if there's a winner, it out puts a message and then exits the game.
    # Draw message only plays if there's no winner and the loop finishes.
    while round < 22 do
      print "Player 1 - "
      @player_one.turn
      puts ""
      @board.render
      #break if @board.winner?("X")
      print "Player 2 - "
      @player_two.turn
      puts ""
      @board.render
      #break if @board.winner?("O")
      round += 1
    end
    puts "It's a DRAW..."
    puts ""
  end

end

ConnectFour.new.game_intro