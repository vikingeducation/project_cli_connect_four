
class Game
  attr_reader :@current_player

  def intialize(num_players)
    @player_1 = Human.new
    determine_players(num_players)
    @board = Board.new
    @current_player = @player_1
  end

  def determine_players(num_players)
   num_players == 1 ? @player_2 = Computer.new : @player_2 = Human.new
  end

  def play
    loop do
      # get player move
      @current_player.get_move
      # display board
      render
      break if game_over?
      switch_player
    end
  end

  def gameover?
    @board.winning_combo? || @board.board_full?
  end

  def switch_player
    @current_player == @player_1 ?
                       @current_player = @player_2 :
                       @current_player = @player_1
  end
