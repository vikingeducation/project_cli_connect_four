require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'computer_player.rb'

class ConnectFour
  def initialize
    @board = Board.new
    @player_x = Player.new("Player 1", :X, @board)
    @player_o = ComputerPlayer.new("Player 2", :O, @board)
    @current_player = @player_x
  end

  def play
    loop do
      @board.render
      @current_player.get_column
      break if check_game_over
      switch_players
    end
  end

  private

  def check_game_over
    check_victory || check_draw
  end

  def check_victory
    if @board.winning_combination?(@current_player.piece)
      @board.render
      if @current_player.is_a?(ComputerPlayer)
        puts "The computer beat you!"
      else
        puts "Congratulations, #{@current_player.name}! You won!"
      end

      true
    else
      false
    end
  end

  def check_draw
    if @board.full?
      puts "It's a draw!"
      true
    else
      false
    end
  end

  def switch_players
    if @current_player == @player_x
      @current_player = @player_o
    else
      @current_player = @player_x
    end
  end
end