# Your code here!
class Game

  # Interwebs fail...
  def initialize
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @current_player = @player1
    @board = Board.new
  end

  # The main play loop
  def play
    welcome
    loop do
      until @board.drop_token(@current_player.get_move_column) do
        puts "Column full! Please choose another column!"
        print "> "
      end
    #  board_render
    #  wins?
    # keep doing moves in a loop
    # until board is full or someone wins
    # quit or play again?
      if @current_player == @player1
        @current_player = @player2
      else
        @current_player = @player1
      end
    end

  end


  def welcome
    puts "Welcome to Connect Four.  This is a 2 player game."
    puts "Player 1, it's your turn. Let's play."
  end


end




#************************
class Board
  def initialize

  end

  def drop_token(column_number)
    true
  end

  def column_full
  end

  def board_full
  end


end





#************************
class Player

  def initialize(game_token)
    @game_token = game_token
  end

  # Returns the column they drop the token into
  def get_move_column

    # prompt player to make move
    # store that into a variable
    puts "Make your move, player #{@game_token}.  Which column (0-6)?"
    print "> "
    move = gets.chomp.to_i

    until (0..6).include?(move)
      puts "Nope, try again. 0-6 only, please!"
      print "> "
      move = gets.chomp.to_i
    end

  end


end





#************************
class AI

  def initialize

  end

  # Returns the column they drop the token into
  def get_move_column
    
  end


end

schwad = Game.new
schwad.play









