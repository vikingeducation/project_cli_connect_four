require './board.rb'
require './player.rb'
require './ai.rb'

class ConnectFour

  def initialize( width, height, players )
    @game_board = Board.new( width, height )
    @p1 = Player.new("R", "Player 1")
    @p2 = Player.new("Y", "Player 2")
    @tachikoma = Tachikoma.new("Y")
    @current_player = @p1
    @players = players
  end
  
  def play
    welcome_message
    loop do
      until @game_board.make_move( @current_player.get_move, @current_player.color ) do
      end
      check_win
      check_full
      display_board
      next_player
    end
  end
  
  def check_win
    if @game_board.player_won
      puts ""
      puts "Congratulations, #{@current_player.pid}, you won!"
      exit
    end
  end
  
  def check_full
    if @game_board.is_full?
      puts ""
      puts "The board is full, it's a draw!"
      puts ""
      exit
    end
  end
  
  def next_player
    if @players == 2
      if @current_player == @p1
        @current_player = @p2
      else
        @current_player = @p1
      end
    else
      if @current_player == @p1
        @current_player = @tachikoma
      else
        @current_player = @p1
      end
    end
  end
  
  def welcome_message
    if @players == 1
      puts ""
      puts "Welcome to Connect Four! You'll be playing as Red (R) against Tachikoma, who is playing as Yellow (Y). Good luck!"
      puts ""
    else
      puts ""
      puts "Welcome to Connect Four! Player 1 is Red (R) and Player 2 is Yellow (Y). Have fun!"
      puts ""
    end
  end
  
  def display_board
    @game_board.display
  end

end