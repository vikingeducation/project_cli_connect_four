class Board
  
  def initialize( width, height )
    @board_width = width
    @board_height = height
    @board = Array.new(@board_width){ Array.new(@board_height)}
  end
  
  def display
    puts ""
    puts "Current board:"
    puts ""
    
    row = 0
    while row < @board_width
      col = 0
      while col < @board_height
        if @board[row][col] != nil
          print "#{@board[row][col]}\t"
        else
          print "-\t"
        end
        col += 1
      end
      puts ""
      row += 1
    end
    puts "one\ttwo\tthree\tfour\tfive\tsix\t"
    puts ""
  end
  
  def is_full?
    if @board.flatten.all?
      true
    end
  end
  
  def column_full?( column )
    if @board[0][column] != nil
      true
    end
  end
  
  def player_won
    vertical? || horizontal? || up_diagonal? || down_diagonal?
  end
  
  def vertical?
    @board.each do |row|
      0.upto(2) do |col|
        test_win = [ row[col], row[col+1], row[col+2], row[col+3] ]
        return true if winning_combo?( test_win )
      end
    end
    false
  end

  def horizontal?
    col = 0
    while col < @board_width do
      0.upto(3) do |row|
        test_win = [ @board[row][col], @board[row+1][col], @board[row+2][col], @board[row+3][col] ]
        return true if winning_combo?( test_win )
      end
      col += 1
    end
    false
  end

  def up_diagonal?
    row = 0
    while row < 4 do
      0.upto(2) do |col|
        test_win = [ @board[row][col], @board[row+1][col+1], @board[row+2][col+2], @board[row+3][col+3] ]
        return true if winning_combo?( test_win )
      end
      row += 1
    end
    false
  end

  def down_diagonal?
    row = 0
    while row < 4 do
      5.downto(3) do |col|
        test_win = [ @board[row][col], @board[row+1][col-1], @board[row+2][col-2], @board[row+3][col-3] ]
        return true if winning_combo?( test_win )
      end
      row += 1
    end
    false
  end

  def winning_combo?( test_win )
    test_win.all? && test_win.uniq.length == 1
  end
  
  def make_move( column, color )
    if column_full?( column )
      puts ""
      puts "Column is full! Please try a different column."
      false
    else 
      row = @board_height
      until @board[row][column] == nil
        row -= 1
      end
      @board[row][column] = color
      true
    end
  end

end