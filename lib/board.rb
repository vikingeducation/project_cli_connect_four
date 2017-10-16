require 'pry'

class Board
  attr_accessor :board

  def initialize(board = nil)
    @board = board ||= Array.new(6){Array.new(7)}
    # @board = board || Array.new(6){Array.new(7)}
    raise "Board has to be an Array" unless board.is_a? (Array)
    raise "Array has to be 2D = 6 by 7" unless board.size == 6 && board[0].size == 7
  end

  def render
    puts
    @board.size.times do |row|
      print "1 2 3 4 5 6 7 \n" if row == 0
      @board[row].size.times do |col|
        @board[row][col].nil? ? print("_|") : print("#{@board[row][col]}|")
      end
      puts
    end
      puts
  end

  def is_board_full?
    !@board.any? {|row| row.include? nil}
  end

  def add_pegs(col_guessed, peg_symbol)
    col = col_guessed - 1
    5.downto(0) do |row|
      if @board[row][col].nil?
        @board[row][col] = peg_symbol
        break
      end
    end
  end

  def slot_empty?(row, col_guessed)
     within_board_range?(row, col_guessed ) && @board[row][col_guessed - 1] == nil ? true : false
  end

  def can_drop_peg_here?(col_guessed)
    self.slot_empty?(0, col_guessed) ? true : false
  end

  def is_valid_input?(col_guessed)
    "1234567".include? col_guessed.to_s
  end

  def within_board_range?(row, col_guessed)
    row <= 5 && col_guessed - 1 <= 6
  end

end