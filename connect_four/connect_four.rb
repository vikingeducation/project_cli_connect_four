# /connect_four.rb
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
      @cur_player.select_row(1)
      puts up_down
      break if game_over?
      puts "the game continued"
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
    (0..6).each do |col|
      matches = 0
      prev = ""
      match_arr = []
      @board.board_arr[col].each do |key|
        if key == "_"
          prev = ""
        end
        if key == prev
          matches += 1
          match_arr << key
        end
          prev = key
        if matches < 4
          puts "number of matches is #{matches}"
          puts match_arr.to_s
        else
          puts "it worrrrrrked!"
        end
      end
    end
    false
  end

  def game_over?
    up_down ? true : false
  end

  # change_player
end

class Board
  attr_accessor :board_arr
  def initialize
    @board_arr = Array.new(7) {Array.new(7, "_")}
  end
  # board_arr
  # def board_arr
  #   @board_arr
  # end

  # render
  def render
    puts board_arr.to_s
    (0..6).each do |y|
      output_str = "\n|"
      (0..6).each do |x|
         output_str << "  #{@board_arr[x][y]}  |"
      end
      puts output_str + "\n"
    end
    col_str = "\n|"
    (1..7).each {|n| col_str << "  #{n}  |"}
    puts col_str
  end
end

class Player
  # initialize
  def initialize(board)
    @piece = ""
    @board = board
  end

  def piece
    @piece
  end

  def def_piece(input)
    if val_piece(input)
      @piece = input
    else
      puts "please select a symbol or letter, (not a number)"
    end
  end

  # select_row
  def select_row(input)
    #
  end

  private

  # val_piece
  def val_piece(input)
    # Checks to see if input for piece value is valid
    input.is_a?(Integer) || input.length > 1 ? false : true
  end
end

g = Game.new
g.play
