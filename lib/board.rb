class Board

  def initialize
   @grid = Array.new(7){Array.new(6){[]}}
  end

  def render_board
    @grid.transpose.reverse.each do |rows|
      rows.each do |space|
        if space.empty?
          print "|___|"
        else
          print "|#{space.color.center(3, '_')}|"
        end
      end
      puts
    end
  end

# Array[column number][row number]
# Array[0][0] left hand bottom corner

  def update_board(column, color)
    @grid[column][bottom(column)] = Piece.new(color)
  end


  # tells you the bottom of the column
  def bottom(column)
    @grid[column].index([])
  end

  def horizontals
    @grid.transpose
  end

  def verticals
    @grid
  end

  def rising_diagonals
    rising_diagonals = []
    (0..2).each do |start|
      col = 0
      diagonals = []
      (start..5).each do |row|
        diagonals << @grid[col][row]
        col += 1
      end
      rising_diagonals << diagonals
    end
    (1..3).each do |start|
      row = 0
      diagonals = []
      (start..6).each do |col|
        diagonals << @grid[col][row]
        row += 1
      end
      rising_diagonals << diagonals
    end
    rising_diagonals
  end


  def falling_diagonals
    falling_diagonals = []
    (3..5).each do |start|
      col = 0
      diagonals = []
      start.downto(0) do |row|
        diagonals << @grid[col][row]
        col += 1
      end
      falling_diagonals << diagonals
    end
    (1..3).each do |start|
      row = 5
      diagonals = []
      (start..6).each do |col|
        diagonals << @grid[col][row]
        row -= 1
      end
      falling_diagonals << diagonals
    end
    falling_diagonals

  end


# [validate that move is legal method]

end