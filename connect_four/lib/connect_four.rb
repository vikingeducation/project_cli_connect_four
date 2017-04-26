# /connect_four.
require_relative 'player'
require_relative 'board'
# require_relative 'game'

class Game
  def initialize
    @board = Board.new
    @board_arr = @board.board_arr
    @player1 = Player.new(@board)
    @player2 = Player.new(@board)
    @cur_player = @player1
  end
  # play
  def play
    select_symbol
    loop do
      @board.render
      if @cur_player == @player1
        selection = @cur_player.get_select
      else
        selection = @cur_player.ai_selection
      end
      @cur_player.place_piece(selection)
      break if @board.game_over?
      change_player
    end
    
  end

######
# This method provides a board containing a winning sequence

private

def select_symbol
  # Identifies player piece designations
  puts "Player 1, select your symbol"
  # @player1.def_piece(gets.chomp)
  @player1.def_piece("X")
  # puts "Player 1, you are #{@player1.piece}"
  # puts "Player 2, select your symbol"
  # @player2.def_piece(gets.chomp)
  @player2.def_piece("O")
end

  # change_player
  def change_player
    if @cur_player == @player1
      @cur_player = @player2
      puts "Your turn, Player 2"
    else
      @cur_player = @player1
      puts
      puts "Your turn, Player 1"
    end
  end

end



g = Game.new
g.play
