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
    # Identifies player piece designations
    puts "Player 1, select your symbol"
    # @player1.def_piece(gets.chomp)
    @player1.def_piece("X")
    puts "Player 2, select your symbol"
    # @player2.def_piece(gets.chomp)
    @player2.def_piece("O")

    #breaks up loop
    i = 0
    loop do
      # test_horizontal
      # test_horizontal_fail
      # test_diagonal
      # test_vertical
      # test_draw

      @board.render
      #@cur_player.select_col(gets.chomp)
      # ai_selection = ai_select_col
      # puts ai_selection
      # #@cur_player.select_col(ai_selection)

########## RANDOMIZER
      @cur_player.select_col(Random.new.rand(1..7))
      #######

      break if game_over?
      change_player
      i += 1
      break if i > 150
    end
  end

######
# This method provides a board containing a winning sequence
def test_vertical
  @board_arr[0][0] = "X"
  @board_arr[1][1] = "X"
  @board_arr[1][2] = "X"
  @board_arr[1][3] = "X"
#  @board_arr[1][4] = "X"
#  @board_arr[1][5] = "X"
end

def test_horizontal
  @board_arr[2][6] = "O"
  @board_arr[3][6] = "O"
  @board_arr[4][6] = "O"
  @board_arr[5][6] = "O"
end

def test_horizontal_fail
  @board_arr[2][6] = "O"
  @board_arr[3][6] = "O"
  @board_arr[4][6] = "O"
  @board_arr[5][6] = "X"
  @board_arr[6][6] = "O"
end

def test_diagonal
  @board_arr[3][1] = "Y"
  @board_arr[2][2] = "Y"
  @board_arr[1][3] = "Y"
  @board_arr[0][4] = "Y"
end

def test_draw
  @board_arr.each do |row|
    row.map! { |n| n = "*"}
  end
end

private
  def vertical
    win = false
    # iterates through each of the columns
    (0..6).each do |col|
      matches = 0
      prev = ""
      @board_arr[col].each do |piece|
        break if win == true
        if piece == "-"
          prev = ""
        end
        if piece == prev
          matches += 1
        end
        prev = piece
        if matches > 2
            win = true
        end
      end
    end
    win
  end

  def find_matches(win, matches, prev, piece)
    puts piece
    if piece == "-"
      prev = ""
    end
    if piece == prev
      matches += 1
    end
    prev = piece
    if matches > 2
        win = true
    end
  end

  def horizontal
    win = false
    (0..6).each do |row|
      puts "the number of matches has been reset to 0"
      puts "we begin row #{row}"
      matches = 0
      prev = ""
      (0..6).each do |col|
        break if win == true
        piece = @board_arr[col][row]
        puts "the value in column #{col + 1} is #{piece}"
        if piece == "-"
          prev = ""
          puts "the previous piece is empty. No match is possible"
        end
        if piece == prev
          matches += 1
          puts "This piece matches the previous piece, so now the number of matches is #{matches}"
        end
        prev = piece
        if matches > 2
          puts "The piece in Row #{row} and column #{col + 1} is match number #{matches}"
            win = true
        end
        # puts piece
        # find_matches(win, matches, prev, piece)
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
          piece = @board_arr[col][row]
          if piece == "-"
            prev = ""
          end
          if piece == prev
            matches += 1
          end
          prev = piece
          if matches > 2
              win = true
          end
          col += 1
          row += 1
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
          piece = @board_arr[col][row]
          if piece == "-"
            prev = ""
          end
          if piece == prev
            matches += 1
          end
          prev = piece
          if matches > 2
              win = true
          end
          col += 1
          row -= 1
        end
      end
    end
    win
  end

  def draw
    test_results = Array.new(7)
    (0..6).each do |row|
      # returns true if row is full
      if @board_arr[row].index("-") == nil
        test_results[row] = true
      else
        test_results[row] = false
      end
    end
      puts test_results.to_s
      # if there are no empty rows, returns true
      if test_results.index(false) == nil
        return true
      else
        return false
      end
      puts test_results.index(nil)
  end

 #abstract the end_game value to Game class
  def game_over?
    end_game = false
   if vertical || horizontal || diagonal || draw
    end_game = true
    @board.render
    unless draw
      if @cur_player == @player1
        puts "Player 1 wins!"
      else
        puts "Player 2 wins!"
      end
      if vertical
        puts "Vertical match"
      elsif horizontal
        puts "Horizontal match"
      elsif diagonal
        puts "Diagonal match"
      else
        puts "Your code has a bug"
      end
    else
      puts "It's a draw!"
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

  def ai_select_col
    test_board = @board
    test_player = Player.new(test_board)
    test_opp = Player.new(test_board)
    return 1
  end



end



g = Game.new
g.play
