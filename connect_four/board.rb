class Board
  attr_accessor :grid

  # grid is in rows and columns, beginning (index 0) of a column is the "top" of the board

  def initialize
    @grid = []
    (0..6).each do |col|
      @grid[col] = []
      (0..5).each do |row|
        @grid[col][row] = "-"
      end
    end
  end

  def add_piece(team, col)
    if (team == 'red')
      piece = 'R'
    elsif(team == 'black')
      piece = 'B'
    end

    @grid[col].each_with_index do |item,index|
      if item == "-"
        if index == 5
          @grid[col][index] = piece
          break
        else
          next
        end
      else
        if index == 0
          return false
        else
          @grid[col][index-1] = piece
        end
      end
    end
  end

  def to_s
    string = ""   
    0.upto(5).each do |row|
      0.upto(6).each do |cols|
        string << "#{@grid[cols][row]}"
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

  end

  def board_full?

  end

  def win?(team_color)


  end


end