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
    @board[column].length >= 6
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

  def has_four_in_a_row?(line)
    return false if line.length < 4
    piece_color = line[0]
    counter = 0
    line.each do |piece|
      if piece == piece_color
        counter += 1
      else
        counter = 1 
        piece_color = piece
      end
      return true if counter == 4
    end
    false
  end

  def win?
    p verticals
    p horizontals
    lines = verticals + horizontals #+ diagonals # line is an array upto size 7
    lines.each do |line|
      return true if has_four_in_a_row?(line)
    end
    false
  end

  def fill_board
    #initialize board
    full_board = []
    7.times do
      full_board << []
    end

    #build board
    7.times do |col|
      6.times do |row|
        if @board[col][row]
          full_board[col] << @board[col][row]
        else
          full_board[col] << " "
        end
      end
    end
    full_board
  end

  def render

    full_board = fill_board

    #transpose_board(full_board)
    full_board.transpose.reverse.each do |row|
      puts "|" + row.join(" ") + "|"
    end
     puts "+- - - - - - -+"
     puts " 1 2 3 4 5 6 7 "

  end
end
