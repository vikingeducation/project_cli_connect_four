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

  def win?
    p verticals
    p horizontals
    p diagonals
    lines = verticals + horizontals + diagonals # line is an array upto size 7
    lines.each do |line|
      return true if has_four_in_a_row?(line)
    end
    false
  end

  def full?
    @board.all? { |col| col.length == 6 }
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
  
  private

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
    diagonals = right_diagonals + left_diagonals 
  end

  def right_diagonals
    diagonals = []
    6.times do |n|
      #diagonals << create_left_diagonal(n)
      diagonals << create_right_top_diagonal(n)
      
    end

    7.times do |n|
      diagonals << create_right_bottom_diagonal(n)
      
    end
    diagonals
  end


  def left_diagonals
    diagonals = []
    6.times do |n|
      #diagonals << create_left_diagonal(n)
      diagonals << create_left_top_diagonal(n)
      
    end

    7.times do |n|
      diagonals << create_left_bottom_diagonal(n)
      
    end
    diagonals
  end

  def create_right_top_diagonal(n)
    full_board = fill_board(nil)

    diagonal = []
    row_i = n
    col_i = 0
  
    until row_i > 5
    
      diagonal << full_board[col_i][row_i]
      row_i += 1
      col_i += 1
    end

    diagonal
    
  end

  def create_right_bottom_diagonal(n)
    full_board = fill_board(nil)
    diagonal = []
    row_i = 0
    col_i = n
    until col_i > 6
      diagonal << full_board[col_i][row_i]
      row_i += 1
      col_i += 1
    end
    diagonal
  end

  def create_left_top_diagonal(n)
    full_board = fill_board(nil)

    diagonal = []
    row_i = n
    col_i = 6
  
    until row_i < 0 || col_i < 0
    
      diagonal << full_board[col_i][row_i]
      row_i -= 1
      col_i -= 1
    end

    diagonal
    
  end

  def create_left_bottom_diagonal(n)
    full_board = fill_board(nil)
    diagonal = []
    row_i = 5
    col_i = n
    until row_i < 0 || col_i > 6
      diagonal << full_board[col_i][row_i]
      row_i -= 1
      col_i += 1
    end
    diagonal
  end

  def has_four_in_a_row?(line)
    return false if line.length < 4
    piece_color = line[0]
    counter = 0
    line.each do |piece|
      if piece == piece_color && piece != nil
        counter += 1
      elsif piece != nil
        
        counter = 1 
        piece_color = piece
      end
      return true if counter == 4
    end
    false
  end

  def fill_board(filler=" ")
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
          full_board[col] << filler
        end
      end
    end
    full_board
  end


end
