class Game

  def initialize
    @board = Board.new
  end

  attr_reader :board, :player_1, :player_2

  def play
    player_config
    game_loop
  end

  def player_config
    @player_1 = Player.new("Player 1", 'X')
    @player_2 = Player.new("Player 2", 'O')
    @current_player = @player_1
  end

  def game_loop
    puts "Welcome to Connect 4! Type 'q' to quit"
    until winner? || draw?
      @board.render
      player_move = player_input
      @board.place(@current_player.piece_type, player_move)
      switch_player
    end
    if winner?
      @board.render
      puts "Winner!"
    end
    puts "Draw!" if draw?
  end

  def player_input
    player_move = nil
    loop do
      instructions
      player_input = gets.chomp
      player_move = player_input.to_i
      break if move_valid?(player_move)
      puts "Invalid move"
    end
    player_move.to_i
  end

  def instructions
    print "#{@current_player.player_name}, in which column would you like to place your piece? (0-6) "
  end

  def move_valid?(column_index)
    valid_column?(column_index) && !@board.column_full?(column_index) && string_is_integer?(column_index)
  end

  def string_is_integer?(input)
    input.to_i.to_s == input
  end

  def valid_column?(column_index)
    (0..6).include?(column_index.to_i)
  end

  def draw?
    @board.board_full?
  end

  def winner?
    @board.detected_win?(@player_1.piece_type) || @board.detected_win?(@player_2.piece_type)
  end

  def switch_player
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

end
