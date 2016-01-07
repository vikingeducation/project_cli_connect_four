require_relative "./board.rb"
require_relative "./player.rb"

# Class: ConnectFour
#   initialize
#   welcome
#   set_symbol
#   play
#   get_input
#   make_move
#   valid_input?
#   switch_players
#   check_game_over
#   check_victory
#   check_draw


class ConnectFour

  def initialize
    @board = Board.new
    @player1 = Player.new("Player1")
    @player2 = Player.new("Player2")
    @turn = @player1
    @game_status = false
  end

   def welcome
    puts "********************************************************"
    puts "Welcome to Connect Four!".center(55)
    puts "Player1 please choose your piece.".center(55)
    puts "Piece available: 'x' or 'o'".center(55)
    puts "********************************************************"
    set_symbol
  end

  def set_symbol
    @turn.choose_symbol
    @player1.symbol == "X" ? @player2.symbol = "O" : @player2.symbol = "X"
  end

  def play
    welcome
    until @game_status
      get_input
      make_move
      @board.render
      check_game_over
      switch_players
    end
  end

  def get_input
    @turn.choose_column
    valid_input?(@turn.column)
  end

  def make_move
    @board.add_piece(@turn.symbol, @turn.column)
  end

  def valid_input?(column)
    if @board.column_full?(column)
      puts "That column is full, try again"
      get_input
    end
  end

  def switch_players
    if @turn == @player1
      @turn = @player2
    else
      @turn = @player1
    end
  end

  def check_game_over
    check_victory
    check_draw
  end

  # check if winning combination exists
  def check_victory
    if @board.winning_combination?(@turn.symbol)
      winner = @turn.name
      puts "You won #{winner}!"
      @game_status = true
    end
  end

  def check_draw
    if @board.full?
      puts "It's a draw."
      @game_status = true
    end
  end
end

game = ConnectFour.new
game.play

