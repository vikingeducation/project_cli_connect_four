class Board
  def initialize
    @board = []
    7.times do |col|
      @board << []
    end
  end

  def add_piece(color, column)
    unless col_full?(column)
      @board[column] << color
    else
      false
    end
  end

  def col_full?(column)
    @board[column].length >= 7
  end

  def win?
    check_lines?
  end

  def verticals
    @board
  end

  def horizontals

    horizontals = []
    7.times do |n|
      horizontals << create_horizontal(n)
    end
    horizontals
  end

  def create_horizontal(n)
    row = []
      @board.each do |vertical|
        break if (n+1) > vertical.length
        row << vertical[n] 
      end
      row
    end

  def diagonals
    diagonals = left_diagonals + right_diagonals
  end

  def left_diagonals
    diagonals = []
    7.times do |n|
      diagonals << create_left_diagonal(n)
      diagonals << create_right_diagonal(n)
      
    end
    
  end

  def create_right_diagonal(n)
    diagonal = []
    row_i = 0
    #col_i = 0
 

    while row_i < 6 && col_i < 6
      diagonal << @board[n][row_i]
      row_i += 1
      col_i += 1
    end

      
  
  end

  def check_lines?
    lines = verticals + horizontals #+ diagonals # line is an array upto size 7
    lines.each do |line|
      return true if has_four_in_a_row?(line)
    end
    false
  end

  def has_four_in_a_row?(line)
    return false if line.length < 4
    piece_color = line[0]
    counter = 0
    line.each do |piece|
      piece == piece_color ? counter += 1 : piece_color = piece
      return true if counter == 4
    end
    false
  end

  def render
    p self

  end
end
