
require "disk"

class Board
  NUM_ROWS = 6
  NUM_COLS = 7
  FOUR = 4

  attr_accessor :board

  def initialize
    @board = empty_board
  end

  def empty_board
    Array.new(NUM_ROWS) { Array.new(NUM_COLS) }
  end

  #prints board
  def render
    puts
    (NUM_ROWS - 1).downto 0 do | i |
      @board[i].each do |square|
        if square.nil?
          print "- "
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
    check_rows || check_cols || check_diagonals
  end

  #check for connect 4 along rows
  def check_rows
    @board.each do |row|
      (0...NUM_COLS - FOUR + 1).each do |i|
        return check_connect_four?( row[i...i+FOUR] )
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
    return false if arr.any?(&:nil?)
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

  #return a board object
  def dup
    copy = Board.new
    (0...NUM_ROWS).each do |row|
      (0...NUM_COLS).each do |col|
        square = @board[row][col]
        if !square.nil? && square.owner == "1"
          copy.board[row][col] = Disk.make_player_1_disk
        elsif !square.nil? && square.owner == "2"
          copy.board[row][col] = Disk.make_player_2_disk
        end
      end
    end
    copy
  end

  def winning_move
    (0..6).each do | col |
      copy_board = self.dup
      copy_board.place_disk(  Disk.make_player_2_disk, col )
      return col+1 if copy_board.win_conditions?
    end

    return nil
  end


end
