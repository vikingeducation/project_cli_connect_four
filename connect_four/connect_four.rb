class ConnectFour
  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new(@board, 'O')
    @player2 = HumanPlayer.new(@board, 'X')
    @current_player = @player1
  end

  def play
    welcome_message
    loop do 
      @board.display
      @current_player.make_move
      if game_over?
        end_game
        break
      end
      switch_players
    end
  end

  def welcome_message
    puts "Welcome to connect four!"
  end

  def end_game
    @board.display
    puts "Player #{@current_player.piece} wins!"
  end
  def game_over?
    @board.full? || @board.four_connected?
  end

  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

end



#choose size