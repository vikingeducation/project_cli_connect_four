require_relative 'board.rb' 
require_relative 'player.rb' 
require_relative 'human.rb' 
require_relative 'computer.rb'

class ConnectFour

  def initialize
    @board = Board.new
    @board.setup
    @player_1 = Human.new
  end

  def play_connect_four
    display_instructions
    opponent_prompt
    color_prompt

    until @board.win? || @board.draw? do
      @board.render
      @player_1.add_piece(@player_1.select_move)
    end
  end

  def display_instructions

  end

  def opponent_prompt

  end

  def color_prompt

  end

end

game = ConnectFour.new

game.play_connect_four