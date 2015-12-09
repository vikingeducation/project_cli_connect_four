require_relative 'board'
require_relative 'board'
require_relative 'human'


class ConnectFour

  def initialize
    @board = Board.new
    @mode = nil
    @player_one_piece = "X"
    @player_two_piece = "O"
    @player_one = Human.new(@board, @player_one_piece)
    @player_two = Human.new(@board, @player_two_piece)
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
    @mode = @player_one.set_mode
    @player_two = Computer.new(@board, @player_two_piece) if @mode == '2'
    start_game
  end

  private

  def start_game
    @board.render
    round = 1
    while round < 22 do
      print "Player 1 - "
      @player_one.turn
      puts ""
      @board.render
      test_for_winner("Player 1", @player_one_piece)
      print "Player 2 - "
      @player_two.turn
      puts ""
      @board.render
      test_for_winner("Player 2", @player_two_piece)
      round += 1
    end
    puts "It's a DRAW..."
    puts ""
  end

  def test_for_winner(player, piece)
    if @board.winner?(piece)
      puts "Connect Four!"
      puts ""
      puts "#{player} Wins!"
      puts ""
      exit
    end
  end

end

ConnectFour.new.game_intro