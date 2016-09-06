
class Game
  def initialize
    @board = Board.new
    @player_x = Player.new("x", @board)
    @player_y = Player.new("o", @board)
    @current_player = @player_x
  end
  
  def play
    
    loop do
      @board.render
      @current_player.get_move  
          
      break if @board.win? || @board.check_full_board?
        
      switch_players
    end
        
  end
    
  def switch_players
    if @current_player == @player_x
      @current_player = @player_y
    else
      @current_player = @player_x    
    end
    
  end
end