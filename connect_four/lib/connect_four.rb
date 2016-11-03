class ConnectFour
  attr_accessor :board

  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new(@board, 'O')
    @player2 = HumanPlayer.new(@board, 'X')
    @current_player = @player1
  end

  def play
    welcome_message
    get_players
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

  def get_players
    puts "Select one or two player game. (1/2)"
    input = gets.chomp.strip
    if valid_player_input?(input)
      set_players(input.to_i)
    else
      get_players
    end
  end

  def set_players(players)
    if players == 1
      @player2 = BotPlayer.new(@board, 'X')
    end
  end

  def valid_player_input?(input)
    ["1","2"].include?(input)
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
