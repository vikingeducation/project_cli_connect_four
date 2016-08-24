require_relative('board.rb')
require_relative('player.rb')

class ConnectFour

  def initialize
    @board = Board.new
    @player_1 = Player.new("Player 1", :X, @board)
    @player_2 = Player.new("Player 2", :O, @board)
    @current_player = @player_1
  end

  def play
    welcome
    loop do
      @board.render
      @current_player.get_column
      break if game_over?
      switch_players
    end
  end

  def welcome
    puts "#########################"
    puts "#       Welcome to      #"
    puts "#      Connect Four     #"
    puts "#########################"
  end

  def game_over?
    if win? || draw?
      true
    else
      false
    end
  end

  def win?
    if @board.winning_move?(@current_player.piece)
      puts "# Congratulations, #{@current_player}, you win!"
      true
    else
      false
    end
  end

  def draw?
    if @board.full_board?
      puts "# There are no possible moves left, it's a draw."
      true
    else
      false
    end
  end

  def switch_players
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
    end
  end

end

game = ConnectFour.new
game.play