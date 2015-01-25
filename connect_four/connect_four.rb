# Your code here!

class Game

  # Interwebs fail...
  def initialize
    @player1 = Player.new("X")
    @player2 = Player.new("O")
  end

  # The main play loop
  def play
    welcome


    # keep doing moves in a loop
    # until board is full or someone wins
    # quit or play again?

  end


  def welcome
    puts "Welcome to Connect Four.  This is a 2 player game."
    puts "Player 1, it's your turn. Let's play."
  end


end





#************************
class Board


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
    puts "Make your move, bro.  Which column (0-6)?"
    print "> "
    move = gets.chomp.to_i

    unless (0..6).include?(move)
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











