class Game

  def initialize
    @board = Board.new
    @player1 = Human.new
    @player2 = Human.new
    @current_player = @player1
  end

  def play
    until game_over?
      @board.render
      @current_player.make_move
      next unless @board.add_to_col?(@current_player.move)
      switch_player
    end
    @board.render
  end

  def switch_player
    @current_player =  @current_player == @player2 ? @player1 : @player2
  end

  def game_over?
    @board.tie? || @board.full?
  end

  def display_winner_message
    
  end

  def display_tie_message
    
  end

end