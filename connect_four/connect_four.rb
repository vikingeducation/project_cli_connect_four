# Your code here!
#go for the glory
#go for the score
#go for it
#connect four


#a board seven wide and 6 high
#each column is a stack that can only be pushed onto
#rejects move if stack is already 6
require './connect_four_player.rb'
require './connect_four_ai.rb'


class ConnectFour
  def initialize(game_type)
    @board = Board.new
    @player1 = Player.new(@board, "\u{2686}")
    game_type ==1 ? @player2 = ConnectFourAI.new(@board, "\u{2688}") : @player2 = Player.new(@board, "\u{2688}")
  end

  def play
    player = @player1

    loop do
      @board.render
      player.move
      player = swap_players(player)

      break if connect_four? || draw?
    end

    game_over(player)
  end

  def swap_players(player)
    player == @player1 ? @player2 : @player1
  end

  def connect_four?
    @board.check_victory
  end

  def draw?
    @board.check_draw?
  end

  def game_over(player)
    @board.render
    puts "Ay, yo, Game Over"
    puts player == @player1 ? "Player 2 wins!" : "Player 1 wins!"
    exit
  end
end


