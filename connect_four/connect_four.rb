

require './player.rb'
require './board.rb'
require './disk.rb'

require "highline"
CLI = HighLine.new

class ConnectFour
  def initialize
    @player_1 = Player.new
    @player_2 = Player.new
    @board = Board.new
    @current_player = true
    #true = player 1 turn, false = player 2 turn
  end

  def print_intro
    puts "Welcome to Connect Four!"
    puts "Enter number of players (1 or 2):"
  end

  def play
    print_intro

    current_player = get_current_player # initially

    loop do

      @board.render

      player_move = get_user_input 
      until @board.valid_move? ( player_move )
          player_move = get_user_input
          if @current_player
          else
          end

      #valid the move/column
      end
      

      #process the move
      #update the gameboard

      #check win/draw conditions
      #break out if true otherwise continue

    end

  end

  def get_user_input
    loop do
        input = CLI.ask "enter a column 1-7 inclusive"
        case input
        when /[1-7]/
            return input.to_i
        else
            "need valid column"
            next
        end
    end
  end



  def get_current_player

  end

end

game = ConnectFour.new
game.play
