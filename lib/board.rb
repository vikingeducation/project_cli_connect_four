class Board

  BOARD_HEIGHT = 6
  BOARD_WIDTH = 7
  TOP_ROW = 0
  BOTTOM_ROW = BOARD_HEIGHT - 1
  LEFT_COL = 0
  RIGHT_COL = BOARD_WIDTH - 1
  MAX_PIECE_COUNT = BOARD_HEIGHT * BOARD_WIDTH

  DIAGONALS = [[[0, 3], [1, 2], [2, 1], [3, 0]],
              [[0, 4], [1, 3], [2, 2], [3, 1], [4, 0]],
              [[0, 5], [1, 4], [2, 3], [3, 2], [4, 1], [5, 0]],
              [[1, 5], [2, 4], [3, 3], [4, 2], [5, 1]],
              [[2, 5], [3, 4], [4, 3], [5, 2]],
              [[2, 0], [3, 1], [4, 2], [5, 3]],
              [[1, 0], [2, 1], [3, 2], [4, 3], [5, 4]],
              [[0, 0], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5]],
              [[0, 1], [1, 2], [2, 3], [3, 4], [4, 5]],
              [[0, 2], [1, 3], [2, 4], [3, 5]]]

  # grid is in rows and columns, beginning (index 0) of a column is the "top" of the board

  def initialize(grid=empty_grid)
    @grid = grid
  end

  def retrieve_piece(col,row)
    @grid[col][row]
  end

  def empty_grid
    blank_grid = []
    (LEFT_COL..RIGHT_COL).each do |col|
      blank_grid[col] = []
      (TOP_ROW..BOTTOM_ROW).each do |row|
        blank_grid[col][row] = "-"
      end
    end
    blank_grid
  end

  def team_to_piece(team)
    team[0].upcase
  end

  def add_piece(team, col)
    piece = team_to_piece(team)

    @grid[col].each_with_index do |item,index|
      if item == "-"
        if index == BOTTOM_ROW
          @grid[col][index] = piece
          break
        else
          next
        end
      else # item is anything but "blank" (-)
        if index == TOP_ROW
          return false
        else
          @grid[col][index-1] = piece
          break
        end
      end
    end
  end

  def to_s
    string = ""
    TOP_ROW.upto(BOTTOM_ROW).each do |row|
      LEFT_COL.upto(RIGHT_COL).each do |col|
        string << "#{@grid[col][row]}"
      end
      string << "\n"
    end
    string
  end

  def check_game_status
    #player1, player2 wins, board full/draw
    if win?('red')
      'red'
    elsif win?('black')
      'black'
    elsif board_full?
      'draw'
    else
      false
    end
  end

  def board_full?
    LEFT_COL.upto(RIGHT_COL).each do |col|
      TOP_ROW.upto(BOTTOM_ROW).each do |row|
        return false if @grid[col][row] == "-"
      end
    end
    true
  end

  def win?(team_color)
    horizontal_win?(team_color) ||
    vertical_win?(team_color) ||
    diagonal_win?(team_color)
  end

  def horizontal_win?(team_color)
    TOP_ROW.upto(BOTTOM_ROW).each do |row|
      row_pieces = []
      LEFT_COL.upto(RIGHT_COL).each do |col|
        row_pieces << @grid[col][row]
      end

      connections = check_connections(row_pieces, team_color)
      if connections
        return true
      end
    end
    false
  end

  def vertical_win?(team_color)
    LEFT_COL.upto(RIGHT_COL).each do |col|
      connections = check_connections(@grid[col], team_color)
      if connections
        return true
      end
    end
    false
  end

  def diagonal_win?(team_color)
    DIAGONALS.each do |diagonal|
      pieces = diagonal.map { |coord| @grid[coord[0]][coord[1]] }
      return true if check_connections(pieces, team_color)
    end
    false
  end

  def check_connections(array, team_color)
    piece = team_to_piece(team_color)
    connected_pieces = 0
    array.each do |item|
      if item == piece
        connected_pieces += 1
        return true if connected_pieces >= 4
      else
        connected_pieces = 0
      end
    end
    false
  end
end
