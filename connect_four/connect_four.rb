# /connect_four.
require_relative 'player'
require_relative 'board'
#require_relative 'game'

class Game
  def initialize
    @board = Board.new
    @player1 = Player.new(@board)
    @player2 = Player.new(@board)
    @cur_player = @player1
  end
  # play
  def play
    # Identifies player piece designations
    puts "Player 1, select your symbol"
    # @player1.piece(gets.chomp)
    @player1.def_piece("X")
    puts "Player 2, select your symbol"
    # @player2.piece(gets.chomp)
    @player2.def_piece("&")
    loop do
      test_up_down
      test_horizon
      test_vertical
      @board.render
  #    @cur_player.select_row(1)
      break if game_over?
      puts "the game continued because no match was found"
      break
    end
  end

######
# This method provides a board containing a winning sequence
def test_up_down
  @board.board_arr[1][1] = "X"
  @board.board_arr[1][2] = "X"
  @board.board_arr[1][3] = "X"
  @board.board_arr[1][4] = "X"
end

def test_horizon
  @board.board_arr[2][6] = "O"
  @board.board_arr[3][6] = "O"
  @board.board_arr[4][6] = "O"
  @board.board_arr[5][6] = "O"
end

def test_vertical
  @board.board_arr[6][0] = "Y"
  @board.board_arr[5][1] = "Y"
  @board.board_arr[4][2] = "Y"
  @board.board_arr[3][3] = "Y"
end

private
  def up_down
    win = false
    # iterates through each of the columns
    (0..6).each do |col|
      matches = 0
      prev = ""
      @board.board_arr[col].each do |key|
        if key == "-"
          prev = ""
        end
        if key == prev
          matches += 1
        end
        prev = key
        if matches > 2
            win = true
        end
      end
    end
    win
  end

 #abstract the end_game value to Game class
  def game_over?
    end_game = false
   # up_down ? true : false
   if up_down
       puts "horizontal match"
    end_game = true
   end
    end_game
  end

  # change_player
end



g = Game.new
g.play
