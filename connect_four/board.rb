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
    diagonals = []
    (0..2).each do |start|
      i = start
      while i < 6
        diagonals << @board[0][i]
        i += 1
      end
    end
  end

  def falling_diagonals
  end

end