class Board

  def initialize
   @board = Array.new(7){Array.new(6){[]}}
  end

  def render_board


  end

# Array[column number][row number]
# Array[0][0] left hand bottom corner

  def put_piece(column)
    @board[column,bottom(column)]
  end


  # tells you the bottom of the column
  def bottom(column)
    @board[column].index([])
  end

  def horizontals
    @board.transpose
  end

  def verticals
    @board
  end

  def rising_diagonals
    rising_diagonals = []
    (0..2).each do |start|
      col = 0
      diagonals = []
      (start..5).each do |row|
        diagonals << @board[col][row]
        col += 1
      end
      rising_diagonals << diagonals
    end
    (1..3).each do |start|
      row = 0
      diagonals = []
      (start..6).each do |col|
        diagonals << @board[col][row]
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
        diagonals << @board[col][row]
        col += 1
      end
      falling_diagonals << diagonals
    end
    (1..3).each do |start|
      row = 0
      diagonals = []
      start.downto(0) do |col|
        diagonals << @board[col][row]
        row += 1
      end
      falling_diagonals << diagonals
    end
    falling_diagonals
  end

end