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
      test_vertical
      test_horizontal
      test_diagonal
      @board.render
  #    @cur_player.select_row(1)
      break if game_over?
      puts "the game continued because no match was found"
      break
    end
  end

######
# This method provides a board containing a winning sequence
def test_vertical
  @board.board_arr[1][1] = "X"
  @board.board_arr[1][2] = "X"
  @board.board_arr[1][3] = "X"
#  @board.board_arr[1][4] = "X"
end

def test_horizontal
  @board.board_arr[2][6] = "O"
  @board.board_arr[3][6] = "O"
  @board.board_arr[4][6] = "O"
#  @board.board_arr[5][6] = "O"
end

def test_diagonal
  @board.board_arr[1][1] = "Y"
  @board.board_arr[2][2] = "Y"
  @board.board_arr[3][3] = "Y"
  @board.board_arr[4][4] = "Y"
end

private
  def vertical
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
            puts "Vertical match!"
            break
        end
      end
    end
    win
  end

  def horizontal
    win = false
    (0..6).each do |row|
      matches = 0
      prev = ""
      (0..6).each do |col|
        value = @board.board_arr[col][row]
        ## Seperate method?
        if value == "-"
          prev = ""
        end
        if value == prev
          matches += 1
        end
        prev = value
        if matches > 2
            win = true
            puts "Horizontal match!"
            break
        end
        # Seperate method?
      end
    end
    win
  end

  def diagonal
    win = false
    (0..6).each do |col|
      @board.board_arr


  end


 #abstract the end_game value to Game class
  def game_over?
    end_game = false
   # vertical ? true : false
   if vertical || horizontal || diagonal
       puts "a match was made"
    end_game = true
   end
    end_game
  end

  # change_player
end



g = Game.new
g.play
