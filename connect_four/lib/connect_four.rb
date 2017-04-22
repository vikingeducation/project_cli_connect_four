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
      break if game_over?
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

  def vertical
    win = false
    # iterates through each of the columns
    (0..6).each do |col|
      matches = 0
      prev = ""
      @board_arr[col].each do |piece|
        break if win == true
        if piece == "-" || piece != prev
          prev = ""
          matches = 0
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

  def horizontal
    win = false
    (0..6).each do |row|
      matches = 0
      prev = ""
      (0..6).each do |col|
        break if win == true
        piece = @board_arr[col][row]
        if piece == "-" || piece != prev
          prev = ""
          matches = 0
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
          if piece == "-" || piece != prev
            prev = ""
            matches = 0
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
          if piece == "-" || piece != prev
            prev = ""
            matches = 0
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
      # if there are no empty rows, returns true
      if test_results.index(false) == nil
        return true
      else
        return false
      end
  end

 #abstract the end_game value to Game class
  def game_over?
    end_game = false
    if vertical || horizontal || diagonal || draw
    print_outcome
    @board.render
    end_game = true
   end
    end_game
  end

  def print_outcome
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
