# Class: Board
  # grid
  # grid=
  # initialize
  # column_full?
  # full?
  # add_piece
  # render
  # winning_combination?
  # four_in_row
  # winning_diagonal
  # winning_horizontal
  # winning_vertical
  # diagonals
  # up_down_diag
  # down_up_diag
  # verticals
  # horizontals


class Board
  attr_accessor :grid

  # grid is in rows and columns, beginning of a column is the "top" of the board


  def initialize
    @grid = []
    (0..5).each do |row|
      @grid[row] = []
      (0..6).each do |col|
        @grid[row][col] = "_ "
      end
    end
  end

  def column_full?(col)
    @grid[5][col] != "_ "
  end

  def full?
    (0..6).all? {|idx| column_full?(idx) == true }
  end

  def add_piece(piece, col)
    (0..6).each do |row|
      if @grid[row][col] == "_ "
        @grid[row][col] = "#{piece} "
        break
      end
    end
  end

  def render
    print "="*13
    5.downto(0).each do |row|
      puts
      (0..6).each do |cols|
        print @grid[row][cols]
      end
    end
    puts "\n"
    puts "="*13
  end

  def winning_combination?(sym)
    winning_diagonal?(sym) ||
    winning_horizontal?(sym) ||
    winning_vertical?(sym)
  end

private

  def four_in_row?(sym, possible_solutions)
    solution = "#{sym} "*4
    possible_solutions.each do |group_of_four|
      if group_of_four == solution
        return true
      end
    end
    false
  end

  def winning_diagonal?(sym)
    possible_solutions = diagonals
    four_in_row?(sym, possible_solutions)
  end

  def winning_horizontal?(sym)
    possible_solutions = horizontals
    four_in_row?(sym, possible_solutions)
  end

  def winning_vertical?(sym)
    possible_solutions = verticals
    four_in_row?(sym, possible_solutions)
  end

  def diagonals
    all_diags = up_down_diag + down_up_diag
  end

  def up_down_diag
    diag = []
    (0..3).each do |col|
      5.downto(3).each do |row|
        diag << @grid[row][col] + @grid[row-1][col+1] + @grid[row-2][col+2] + @grid[row-3][col+3]
      end
    end
    diag
  end

  def down_up_diag
    diag = []
    (0..3).each do |col|
      (0..2).each do |row|
        diag << @grid[row][col] + @grid[row+1][col+1] + @grid[row+2][col+2] + @grid[row+3][col+3]
      end
    end
    diag
  end

  def verticals
    vert = []
    (0..6).each do |col|
      (0..2).each do |row|
        vert << @grid[row][col] + @grid[row+1][col] + @grid[row+2][col] + @grid[row+3][col]
      end
    end
    vert
  end

  def horizontals
    horiz = []
    @grid.each do |row|
      (0..3).each do |start|
        horiz << row[start] + row[start+1] + row[start+2] + row[start+3]
      end
    end
    horiz
  end
end
