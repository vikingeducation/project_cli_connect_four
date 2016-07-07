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
    Array[column].length.each do |i|
      next until Array[column].empty?
      i
    end
  end




end