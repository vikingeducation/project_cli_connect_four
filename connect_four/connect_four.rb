class ConnectFour
  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new(@board, 'O')
    @player2 = HumanPlayer.new(@board, 'X')
    @current_player = @player1
  end

  def play
    loop do 
      @board.display
      @current_player.make_move
      break if game_over?
      switch_players
    end
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