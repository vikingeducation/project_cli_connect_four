class Board
  attr_accessor :grid

  # grid is in rows and columns, beginning of a column is the "top" of the board

  def initialize
    @grid = {}
    (0..6).each do |row|
      @grid[row] = []
      (0..5).each do |col|
        @grid[row][col] = "_ "
      end
    end
  end

  def add_piece(sym, col)
    if (sym == :X)
      piece = 'X'
    elsif(sym == :O)
      piece = 'O'
    end

    # @grid[row][col] 
    6.downto(0).each do |row|
      if @grid[row][col] != '_ '
        board[row+1][col] == piece
      end
    end
  end

  def to_s
    (0..5).each do |row|
      puts
      (0..6).each do |cols|
        print @grid[cols][row]
      end
    end

  end

  def winning_combination?
    #return true or false
    # 4 diagonal, horizontal, vertical
  end

  def winning_diagonal?
  end
  def winning_horizontal?
  end
  def winning_vertical?
  end

  def diagonals

  end

  def verticals

  end

  def horizontals
  end
end