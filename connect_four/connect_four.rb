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
    puts
    puts "Welcome to Connect Four!"
    puts "Enter number of players (1 or 2):"
    puts
  end

  def play
    print_intro

    current_player = get_current_player # initially

    loop do

      #prints board
      @board.render

      #obtain valid user move
      player_move = get_user_input
      until @board.valid_move? ( player_move )
          player_move = get_user_input
      end

      #process the move
      #update the gameboard
      if @current_player
        @board.place_disk( Disk.make_player_1_disk,  player_move  - 1)
      else
        @board.place_disk( Disk.make_player_2_disk, player_move  - 1 )
      end

      @current_player = !@current_player
     
      #check win/draw conditions
      #break out if true otherwise continue

    end

  end

  def get_user_input
    loop do
        input = CLI.ask "Please enter a valid column from 1 to 7:"
        case input
        when /^[1-7]$/
            return input.to_i
        else
            puts "INVALID INPUT!"
            puts
            next
        end
    end
  end



  def get_current_player

  end

end

game = ConnectFour.new
game.play
