require 'pry'
require 'pry-byebug'
require './board.rb'
require './player.rb'
require './computer.rb'


class Game

  def initialize
    @player1 = Player.new("X")
    @player2 = Player.new("O")
    @current_player = @player1
    @game_board = Board.new
  end

  # The main play loop
  def play
    welcome
    loop do
      #lines 17-19 are my favorite
      until @game_board.drop_token(@current_player.get_move_column,@current_player.game_token) do 
        puts "Column full! Please choose another column!"
        binding.pry
        print ">"
      end
      @game_board.board_render
      swap_players
    end
  end

  def swap_players
      if @current_player == @player1
        @current_player = @player2
      else
        @current_player = @player1
      end
  end

  def welcome
    puts "Welcome to Connect Four. Play against a computer or human? "
    game_answer = gets.strip.chomp
    if game_answer == "human"
    elsif game_answer == "computer"
      @player2 = Computer.new("O")
    end
    puts "Player 1, it's your turn. Let's play."
  end

  def what_is_in_that_element_helper(element_contents)
      if element_contents == nil
        return nil
      elsif element_contents == "X"
        return "X"
      elsif element_contents == "O"
        return "O"
      end
  end
end


schwad = Game.new
schwad.play









