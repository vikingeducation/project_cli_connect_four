=begin
  public - print_board - skip for now per instructions
         - winning_combo? ~
            - set up: board
                      no winning combos
                      at least one of each vertical, horizontal, diagonal winning combo
         - board_full? ~
            - set up: empty board
                      full board
                      almost full board
         - column_full? ~
            - set up: board
                      at least one full column
                      at least one column with a nil space
         - place_piece ~
            -set up: board
                     place a piece
         - board_column - reader ~
         - board - reader ~

  private - initialize
          - diagonals
          - win_diagonal
          - horizontals
          - win_horizontal
          - win_vertical
          - space_available
          - find_four
=end

class Board

  attr_reader :board, :board_column

  def initialize
    @board = [
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
              [nil, nil, nil, nil, nil, nil, nil],
             ]
  end


  # render board
  def print_board
    @board.each do |row|
      print "#{row}\n"
    end
  end


  def winning_combo?(column, piece)
    win_vertical(column, piece) ||
    win_horizontal(column, piece) ||
    win_diagonal(column, piece)
  end


  def board_full?
    @board.all? do |row|
      row.all? {|cell| cell == "x" || cell == "o"}
    end
  end


  def column_full?(column)
    board_column(column).compact == board_column(column)
  end


 # logic to place piece in the last array of the move choosen that isn't already taken
   def place_piece(column, piece)
     if @board[5][column] == nil
       @board[5][column] = piece
     elsif @board[4][column] == nil
       @board[4][column] = piece
     elsif @board[3][column] == nil
       @board[3][column] = piece
     elsif @board[2][column] == nil
       @board[2][column] = piece
     elsif @board[1][column] == nil
       @board[1][column] = piece
     elsif @board[0][column] == nil
       @board[0][column] = piece
     end
   end

   def board_column(column)
     board_column = [
                       @board[0][column],
                       @board[1][column],
                       @board[2][column],
                       @board[3][column],
                       @board[4][column],
                       @board[5][column]
                    ]
    end

  private


  def diagonals(column, piece)
    row = board_column(column).index(piece)
    diagonals = []
    upper_left = 1.upto(3).map do |i|
      @board[row - i][column - i] if space_available(row - i, column -i)
    end
    upper_right = 1.upto(3).map do |i|
      @board[row - i][column + i] if space_available(row - i,column + i)
    end
    lower_left = 1.upto(3).map do |i|
      @board[row + i][column - i] if space_available(row + i, column - i)
    end
    lower_right = 1.upto(3).map do |i|
      @board[row + i][column + i] if space_available(row + i, column + i)
    end
    diagonals << upper_left + [@board[row][column]] + lower_right
    diagonals << upper_right + [@board[row][column]] + lower_left
    diagonals
  end

  def space_available(x,y)
    @board[x] && @board[x][y]
  end


  def win_diagonal(column, piece)
    first, second = diagonals(column, piece)
    find_four(first, piece) ||
    find_four(second, piece)
  end


  def win_vertical(column, piece)
    find_four(board_column(column), piece)
  end


  def horizontals(column, piece)
    row = board_column(column).index(piece)
    horizontals = @board[row]
  end


  def win_horizontal(column, piece)
    find_four(horizontals(column, piece), piece)
  end


  def find_four(arr, piece)
    win_string = piece * 4
    arr.join("").include?(win_string)
  end


end
