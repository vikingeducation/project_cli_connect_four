require_relative 'board'
require_relative 'display'
require_relative 'player'
require_relative 'computer'

class ConnectFour
  attr_reader :game_board, :current_player

  def initialize(type = :player)
    @player1 = Player.new("Player 1", "O")
    @player2 = type == :computer ? Computer.new("Player 2", "X") : Player.new("Player 2", "X") 
    #@player2 = Player.new("Player 2", "X")
    @game_board = Board.new
    @current_player = @player1
  end

  

  def play
    Display.welcome

    loop do

      Display.render(game_board.grid)
      @game_board.move(@current_player.get_input(game_board),@current_player.piece)
      break if game_board.game_over?
      switch_player

    end

    Display.render(game_board.grid)

    end_message(@current_player)

  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  def end_message(player)
    if game_board.victory?
      puts "#{player.name} Wins!!!"
    else
      puts "It's a Draw!!"
    end
  end


end