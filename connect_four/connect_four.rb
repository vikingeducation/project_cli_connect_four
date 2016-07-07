require_relative 'board'
require_relative 'display'
require_relative 'player'

class ConnectFour
  attr_reader :game_board
  include Display

  def initialize
    @player1 = Player.new("Player 1", "O")
    @player2 = Player.new("Player 2", "X")
    @game_board = Board.new
    @current_player = @player1
  end

  def play
    puts "Welcome to Connect Four!"

    loop do
      ## render Board  (Display)
      Display.render(game_board)

      ## get move from player   (Player method)

      ## check game_over?  break    (Board method)

      switch_player

    end

    ## render Board  (Display)

    ## Game end message  (ConnectFour end_message method)

  end

  def switch_player
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

  # def end_message
  #   case (player1 wins, player2 wins, draw)
  #     ""
  #     ""
  #     ""
  # end


end
