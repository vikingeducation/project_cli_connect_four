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
    # @player1.def_piece(gets.chomp)
    @player1.def_piece("X")
    puts "Player 2, select your symbol"
    # @player2.def_piece(gets.chomp)
    @player2.def_piece("&")
    loop do
      test_horizontal
      @board.render
      #@cur_player.select_col(gets.chomp)
      @cur_player.ai_select_col
#      @board.render
      break if game_over?
      change_player
      ###
      break
      ###
    end
  end

######
# This method provides a board containing a winning sequence
def test_vertical
  @board.board_arr[0][0] = "X"
  @board.board_arr[1][1] = "X"
  @board.board_arr[1][2] = "X"
  @board.board_arr[1][3] = "X"
#  @board.board_arr[1][4] = "X"
#  @board.board_arr[1][5] = "X"
end

def test_horizontal
  @board.board_arr[2][6] = "O"
  @board.board_arr[3][6] = "O"
  @board.board_arr[4][6] = "O"
  @board.board_arr[5][6] = "X"
end

def test_diagonal
  @board.board_arr[3][1] = "Y"
  @board.board_arr[2][2] = "Y"
  @board.board_arr[1][3] = "Y"
  @board.board_arr[0][4] = "Y"
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
        break if win == true
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
        end
      end
    end
    win
  end

  def diagonal
    win = false
    iter_arr = (0..6).to_a

    # one direction
    iter_arr.each do |origin_x|
      iter_arr.each do |origin_y|
        col = origin_x
        row = origin_y
        matches = 0
        prev = ""
        reverse = false
        until col > 6 || row > 6
          value = @board.board_arr[col][row]
          if value == "-"
            prev = ""
          end
          if value == prev
            matches += 1
          end
          prev = value
          col += 1
          row += 1
          if matches > 2
              win = true
          end
        end
      end
    end

## the other direction
    iter_arr.each do |origin_x|
      iter_arr.each do |origin_y|
        col = origin_x
        row = origin_y
        matches = 0
        prev = ""
        reverse = false
        until col > 6 || row > 6
          value = @board.board_arr[col][row]
          if value == "-"
            prev = ""
          end
          if value == prev
            matches += 1
          end
          prev = value
          col += 1
          row -= 1
          if matches > 2
              win = true
          end
        end
      end
    end
    win
  end

  def draw
    if @board.board_arr.index("=") == nil
      return true
    else
      return false
    end
  end

 #abstract the end_game value to Game class
  def game_over?
    end_game = false
   if vertical || horizontal || diagonal || draw
    end_game = true
    if @cur_player == @player1
      puts "Player 1 wins!"
    else
      puts "Player 2 wins!"
    end
   end
    end_game
  end

  # change_player
  def change_player
    if @cur_player == @player1
      @cur_player = @player2
      puts "Your turn, Player 2"
    else
      @cur_player = @player1
      "Your turn, Player 1"
    end
  end
end



g = Game.new
g.play
