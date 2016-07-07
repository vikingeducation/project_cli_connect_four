require_relative 'board'
require_relative 'player'
require_relative 'human'
require_relative 'computer'

class Game

  def initialize
    @board = Board.new
    @player1 = Human.new('r')
    @player2 = Human.new('b')
    @current_player = @player1
  end

  def play
    until game_over?
      @board.render
      @current_player.make_move(@board)
      switch_player
    end
    @board.render
  end

  def switch_player
    @current_player =  @current_player == @player2 ? @player1 : @player2
  end

  def game_over?
    @board.win? #|| @board.full?
  end

  def display_winner_message
    
  end

  def display_tie_message
    
  end

end

g = Game.new
g.play