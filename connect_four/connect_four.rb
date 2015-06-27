require './player.rb'
require './board.rb'

class ConnectFour
  def initialize
    @board = Board.new
    game_mode
  end
  
  def game_mode
    # stubbed out for now, will ask if two players or against AI
    @player_1 = Human.new(:r)
    @player_2 = AI.new(:y)
  end

  def game_end?
    # check victory conditions
    # check draw condition
    @board.winning_line?(@current_player.piece)    
  end

  def game_loop
    @current_player = @player_1
    until game_end?
      @current_player.get_move
    # ask the current player for a move (give it the board, so AI can check later)
    switch_player
    end    
  end

  def board_full?
    # ask the board if its full    
  end

  def switch_player
    if @current_player == @player_1
      @current_player = @player_2
    end   
  end
end

go = ConnectFour.new
go.game_loop