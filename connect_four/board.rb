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
      puts "Game is a draw."
    elsif win?('red')
     return 'red'
    elsif win?('black')
     return 'black'
    end  
  end

  def board_full?
    @piece_count == MAX_PIECE_COUNT ? true : false
  end

  def win?(team_color)
    

    
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
  end
end