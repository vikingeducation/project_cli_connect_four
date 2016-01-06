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

  def add_piece(piece, col)
    (0..6).each do |row|
      if @grid[row][col] == "_ "
        @grid[row][col] = "#{piece} "
        break
      end
    end
  end

  def render
    5.downto(0).each do |row|
      puts
      (0..6).each do |cols|
        print @grid[row][cols]
      end
    end
  end

  def winning_combination?(sym)
    #return true or false
    # 4 diagonal, horizontal, vertical
    # winning_diagonal?(sym) ||
    winning_horizontal?(sym) || winning_vertical?(sym)
  end

  def winning_diagonal?(sym)

  end

  def winning_horizontal?(sym)
    possible_solutions = horizontals
    solution = "#{sym} "*4
    possible_solutions.each do |group_of_four|
      if group_of_four == solution
        return true
      else
        return false
      end
    end
  end

  def winning_vertical?(sym)
    possible_solutions = verticals
    solution = "#{sym} "*4
    possible_solutions.each do |group_of_four|
      if group_of_four == solution
        return true
      else
        return false
      end
    end
  end

  def diagonals

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