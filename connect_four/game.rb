class Game

  def initialize
  end

  def play
    player_config
    setup_board
    game_loop
  end

  def player_config
    @player_1 = Player.new("Player 1", 'X')
    @player_2 = Player.new("Player 2", 'O')
    @current_player = @player_1
  end

  def setup_board
    @board = Board.new
  end

  def game_loop
    until winner? || draw?
      @board.render
      player_move = player_input
      @board.place(@current_player, player_move)
      switch_player
    end
  end

  def player_input
    until @board.move_valid?(player_move)
      print "#{@current_player.player_name}, enter your move: "
      player_move = gets.chomp
    end
    player_move
  end

  def draw?
  end

  def winner?
  end

  def quit
  end

  def switch_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

end