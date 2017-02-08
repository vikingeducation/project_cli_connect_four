require_relative "board.rb"
require_relative "player.rb"

# Controls the game play
class ConnectFour
  # initialize
  def initialize
    # set up the board
    @board = Board.new

    # set up the players
    @player_x = Player.new("Player 1", :X, @board)
    @player_o = Player.new("Player 2", :O, @board)

    # assign the starting player
    @current_player = @player_x
  end

  # play
  def play
    # loop infinitely
    loop do
      # call the board rendering method
      @board.render

      # ask for column from the current player
      @current_player.get_column

      # break the loop IF the game is over
      break if check_game_over

      # switch players
      switch_players
    end
  end

  # check_game_over
  def check_game_over
    # check_victory
    # check_draw
    check_victory || check_draw
  end

  # check_victory
  def check_victory
    # IF board says current player's piece has
    # a winning_combination?
    if @board.winning_combination?(@current_player.piece)
      # display a victory message
      @board.render1
      puts "Congratulations, #{@current_player.name}! You won!"
      true
    else
      false
    end
  end

  # check_draw
  def check_draw
    # IF board says it's full
    if @board.full?
      # display a draw message
      puts "It's a draw!"
      true
    else
      false
    end
  end

  # switch_players
  def switch_players
    # PlayerX >> PlayerO or vice versa
    if @current_player == @player_x
      @current_player = @player_o
    else
      @current_player = @player_x
    end
  end
end

game = ConnectFour.new
game.play