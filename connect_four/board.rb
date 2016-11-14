class Board
  attr_reader :board

  def initialize
    @board = Array.new(6){Array.new(7)}
  end

  def render
    puts "DBG: @board = #{@board.inspect}"
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

  def slot_empty?(row, col)
     true if within_board_range?(row, col) && @board[row][col - 1] == nil
  end

  def can_drop_peg_here?(col_guessed)
    self.slot_empty?(0, col_guessed - 1) ? true : puts("Please choose a different column, this one is full!")
  end

  def is_valid_input?(col_guessed)
    "1234567".include? col_guessed.to_s
  end

  def within_board_range?(row, col_guessed)
    row <= 5 && col_guessed <= 6
  end

end