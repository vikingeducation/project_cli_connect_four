class Board
  attr_accessor :grid

  # grid is in rows and columns, beginning of a column is the "top" of the board

  def initialize
    @grid = []
    (0..6).each do |col|
      @grid[col] = []
      (0..5).each do |row|
        @grid[col][row] = "_ "
      end
    end
  end

  def add_piece(team, col)
    if (team == :x)
      piece = 'X'
    elsif(team == :O)
      piece = 'O'
    end

    @grid[col].each_with_index do |spot,index|
      if index == 5
        @grid[col][index] = piece
        break
      elsif spot == 0 
        next
      else
        @grid[col][index-1] = piece
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