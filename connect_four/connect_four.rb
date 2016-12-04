require_relative "display"
require_relative "player"
require_relative "board"
require_relative "human"
require_relative "computer"

class Game
  attr_reader :current_player, :player_1, :player_2

  include Display

  def initialize(num_players)
    @player_1 = Human.new("r")
    determine_players(num_players)
    @board = Board.new
    @current_player = @player_1
  end

  def determine_players(num_players)
    num_players == 1 ?  @player_2 = Computer.new("b") : @player_2 = Human.new("b")
  end

  def play
    loop do
      current_move = @current_player.get_move
      @board.show(current_move, @current_player.color)
      break if game_over?
      switch_player
    end
    if @board.winning_combo?(@current_player.color)
      puts "Congratualtions #{@current_player.name} you win!"
    else
      puts "Sorry, it was a tie"
    end
  end

  def game_over?
    @board.winning_combo?(@current_player.color) || @board.board_full?
  end

  def switch_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

end

Game.new(2).play
