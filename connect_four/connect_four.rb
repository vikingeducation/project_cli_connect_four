require './player.rb'
require './board.rb'
require './disk.rb'

class ConnectFour
  def initialize
    @player_1 = Player.new
    @player_2 = Player.new
    @board = Board.new
  end

  def print_intro
    puts "Welcome to Connect Four!"
    puts "Enter number of players (1 or 2):"
  end

  def play
    print_intro

    counter = 0
    loop do
      counter += 1
      break if counter == 3

      @board.render
      #ask for appropriate player turn

      #validate the input (valid move)
      #valid the move/column

      #process the move
      #update the gameboard

      #check win/draw conditions
      #break out if true otherwise continue
    end

  end

end

game = ConnectFour.new
game.play
