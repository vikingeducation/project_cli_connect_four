class Board
  attr_accessor :grid, :piece_count

  MAX_PIECE_COUNT = 42

  # grid is in rows and columns, beginning (index 0) of a column is the "top" of the board

  def initialize
    @piece_count = 0

    @grid = []
    (0..6).each do |col|
      @grid[col] = []
      (0..5).each do |row|
        @grid[col][row] = "-"
      end
    end
  end

  def team_to_piece(team)
    team[0].upcase
  end

  def add_piece(team, col)
    piece = team_to_piece

    @grid[col].each_with_index do |item,index|
      if item == "-"
        if index == 5
          @grid[col][index] = piece
          @piece_count += 1
          break
        else
          next
        end
      else
        if index == 0
          return false
        else
          @grid[col][index-1] = piece
          @piece_count += 1
        end
      end
    end
  end

  def to_s
    string = ""   
    0.upto(5).each do |row|
      0.upto(6).each do |col|
        string << "#{@grid[col][row]}"
      end
      string << "\n"
    end
    string
  end

  def check_game_status
    #player1, player2 wins, board full/draw
    if board_full? 
      return 'draw'
    elsif win?('red')
      return 'red'
    elsif win?('black')
      return 'black'
    else
      false
    end  
  end

  def board_full?
    @piece_count == MAX_PIECE_COUNT ? true : false
  end

  def win?(team_color)
    if  horizontal_win?(team_color) ||
        vertical_win?(team_color) ||
        diagonal_win?(team_color)
      true
    else
      false
    end
  end

  def horizontal_win?(team_color)
    piece = team_to_piece(team_color)
    0.upto(5).each do |row|
      connected_pieces = 0
      0.upto(6).each do |col|
        if @board[col][row] == piece
          connected_pieces += 1
        else
          connected_pieces = 0
        end
      end
      if connected_pieces == 4
        return true
      end
    end
    false
  end

  def vertical_win?(team_color)
    0.upto(6).each do |col|
      connected_pieces = 0
      0.upto(5).each do |row|
        if @board[col][row] == piece
          connected_pieces += 1
        else
          connected_pieces = 0
        end
      end
      if connected_pieces == 4
        return true
      end
    end
    false
  end

  def diagonal_win?(team_color)
    up_starting_spots = [[5,0],[5,1],[5,2], [5,3],[4,0],[3,0]]
    down_starting_spots = [[0,0],[0,1],[0,2],[0,3],[1,2],[2,0]]

    up_starting_spots.each do |spot|
      diagonal_up = gen_diagonal_up(spot[0], spot[1])
      check_connections(diagonal_up, team_color)
      if check_connections
        true
      end
    end 

    down_starting_spots.each do |spot|
      diagonal_down = gen_diagonal_down(spot[0], spot[1])
      check_connections(diagonal_down, team_color)
      if check_connections
        true
      end
    end

    false
  end

  def check_connections(array, team_color) 
    connected_pieces = 0
    piece = team_to_piece (team_color)
    array.each do |item|
      if item == piece
        connected_pieces += 1
      else
        connected_pieces = 0
      end
    end
    if connected_pieces == 4
      return true
    else 
      return false
    end
  end
  #takes in coordinates, translates them to diagonals
  #returns an array of diagonal_up locations on board
  def gen_diagonal_up(row,col)
    array_diagonals =[]
    0.upto(5).each do |num|
      array_diagonals << [row-num, col+num] 
    end
    array_diagonals.map{|coordinates| @board[coordinates[1]][coordinates[0]]}
  end

  def gen_diagonal_down(row,col)
    array_diagonals =[]
    0.upto(5).each do |num|
      array_diagonals << [row+num, col+num] 
    end
    array_diagonals.map{|coordinates| @board[coordinates[1]][coordinates[0]]}
  end


end