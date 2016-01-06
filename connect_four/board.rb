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

    # @grid[row][col] 
    (0..6).each do |row|
      if @grid[row][col] == "_ "
        @grid[row][col] = "#{piece} "
        break
      end
    end
  end

  def render
    # 6.downto(0).each do |row|
    #   puts
    #   (0..5).each do |cols|
    #     print @grid[row][cols]
    #   end
    # end
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
    winning_diagonal?(sym) ||
    winning_horizontal?(sym) ||
    winning_vertical?(sym)
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