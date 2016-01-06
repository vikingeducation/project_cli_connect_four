
require "./disk"

class Board
  NUM_ROWS = 6
  NUM_COLS = 7
  FOUR = 4

  def initialize
    @board = Array.new(NUM_ROWS) { Array.new(NUM_COLS) }
  end

  #prints board
  def render
    puts
    (NUM_ROWS - 1).downto 0 do | i |
      @board[i].each do |square|
        if square.nil?
          print "o "
        else
          print "#{square.owner} "
        end
      end
      puts
    end
    puts
  end

  #returns false if column is full
  def valid_move?(player_input)
    @board[NUM_ROWS - 1][player_input - 1].nil? ? true : false
  end

  #add disk object to appropraite column
  def place_disk ( disk, column )
    ( 0...NUM_ROWS ).each do | row |
      if !@board[row][column]
        @board[row][column] = disk
        break
      end
    end
  end

  #return true if connect 4 exists and game ends
  def win_conditions?
    return true if check_rows || check_cols || check_diagonals
    return false
  end

  #check for connect 4 along rows
  def check_rows
    @board.each do |row|
      (0...NUM_COLS - FOUR + 1).each do |i|
        return true if check_connect_four?( row[i...i+FOUR] )
      end
    end
    false
  end

  #check every column for 4 vertical
  def check_cols
    (0...NUM_COLS).each do |col|
      (0...NUM_ROWS - FOUR + 1).each do |row|
        col_array = []
        (0...FOUR).each do |index|
          col_array << @board[row + index][col]
        end
        return true if check_connect_four?(col_array)
      end
    end
    false
  end

  #check diagonals for connect 4
  def check_diagonals
    #diagonals from top left to bottom right
    (0..NUM_ROWS - FOUR).each do | row |
      (0..NUM_COLS - FOUR).each do |  col |
        diag_array = []
        (0...FOUR).each do |  square |
          diag_array << @board[row + square][col + square]
        end
        return true if check_connect_four?(diag_array)
      end
    end
    #diagonals from top right to bottom left
   (0..NUM_ROWS - FOUR).each do | row |
      (NUM_COLS - 1).downto ( NUM_COLS - FOUR ) do |  col |
        diag_array = []
        (0...FOUR).each do |  square |
          diag_array << @board[row + square][col - square]
        end
        return true if check_connect_four?(diag_array)
      end
    end
    false
  end

  #checks array for connect 4
  def check_connect_four?(arr)
    #checks for full array
    return false if arr.any? { |square| square == nil }
    #if array is full then check for winner
    return true if arr.all? { |square| square.owner == "1" }
    return true if arr.all? { |square| square.owner == "2" }
    #otherwise return false
    false
  end

  #return true if grid is full, else return false on empty square
  def grid_full?
    @board.each do |row|
      row.each do |square|
        return false if square == nil
      end
    end
    true
  end

  #makes a deep copy of board
  def dup
    copy = Array.new(NUM_ROWS) { Array.new(NUM_COLS) }
    (0...NUM_ROWS).each do |row|
      (0...NUM_COLS).each do |col|
        square = @board[row][col]
        copy[row][col] = square.dup if !square.nil?
      end
    end
  end

end
