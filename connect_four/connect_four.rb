require_relative 'board'
require_relative 'display'
require_relative 'player'

class ConnectFour
  attr_reader :game_board

  def initialize
    @player1 = Player.new("Player 1", "O")
    @player2 = Player.new("Player 2", "X")
    @game_board = Board.new
    @current_player = @player1
  end

  def play
    puts "Welcome to Connect Four!"

    loop do

      Display.render(game_board.grid)
      @current_player.get_input(game_board)
      break if game_board.game_over?
      switch_player

    end

    Display.render(game_board.grid)

    end_message

  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def end_message
    if game_board.victory?
      puts "#{@curent_player.name} Wins!!!"
    else
      puts "It's a Draw!!"
    end
  end


end
