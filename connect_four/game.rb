class Game

  def initialize
  end

  def play
    player_config
    setup_board
    print @board.column_full?(2)
    print @board.column_full?(3)
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
      @board.place(@current_player.piece_type, player_move)
      switch_player
    end
  end

  def player_input
    player_move = nil
    loop do
      print "#{@current_player.player_name}, in which column would you like to place your piece? (0-6) "
      player_move = gets.chomp
      move = parse_player_move(player_move)
      break if move.is_a?(Integer)
    end
    player_move
  end

  def parse_player_move(player_move_string)
    string_is_integer?(player_move_string)
  end

  def move_valid?(column_index)
    valid_column?(column_index) && !column_full?(column_index)
  end

  def valid_column?(column_index)
    (0..6).include?(column_index)
  end

  def string_is_integer?(string)
    string.to_i.to_s == string
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
