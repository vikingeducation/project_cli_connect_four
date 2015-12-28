=begin
  readers - :round

  public methods:
    - initialize
    - game_intro

  private methods:
    - set_one_player_settings
    - start_game
    - test_for_winner(player, piece)
=end

require_relative 'board'
require_relative 'human'
require_relative 'computer'

class ConnectFour

attr_reader :round

  def initialize
    @board = Board.new
    @mode = nil
    @player_one_piece = "X"
    @player_two_piece = "O"
    @player_one = Human.new(@board, @player_one_piece)
    @player_two = Human.new(@board, @player_two_piece)
    @player_one_name = "Player 1"
    @player_two_name = "Player 2"
    @round = 1
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
    set_one_player_settings if @mode == '1'
    start_game
  end

  private

  def set_one_player_settings
    @player_two = Computer.new(@board, @player_two_piece, self)
    @player_one_name = "Human"
    @player_two_name = "Computer"
  end

  def start_game
    @board.render
    while round < 22 do
      print "#{@player_one_name}"
      @player_one.turn
      puts ""
      @board.render
      test_for_winner(@player_one_name, @player_one_piece)
      print "#{@player_two_name}"
      @player_two.turn
      puts ""
      @board.render
      test_for_winner(@player_two_name, @player_two_piece)
      @round += 1
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

# ConnectFour.new.game_intro