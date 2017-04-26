# board.rb
class Board
  attr_accessor :board_arr
  def initialize
    @board_arr = Array.new(7) {Array.new(7, "-")}
  end

  # render
  def render
###################################
    # (0..6).each do |x|
    #    i = 0
    #    (0..6).each do |y|
    #      @board_arr[x][y] = i
    #      i += 1
    #    end
    #  end
 ######################################
  #  puts board_arr.to_s
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

  #abstract the end_game value to Game class
   def game_over?
     end_game = false
     if vertical || horizontal || diagonal || draw
     render
     print_outcome
     end_game = true
    end
     end_game
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
end
