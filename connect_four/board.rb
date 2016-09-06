class Board
  def initialize
    @board = Array.new(6){Array.new(7)}
    @turns = 0  
    @colhash = {0 => 5, 1 => 5, 2 => 5, 3 => 5, 4 => 5, 5 => 5, 6 => 5, 7 => 5}
  end

  #ADD PIECE
  def add_piece(col, piece)
    #add the piece to data structure
    #increment the turn
    puts ("added")
  end
      
  
  def render
    puts
    @board.each do |row|
      row.each do |cell|
        cell.nil? ? print(" - ") : print(cell.to_s)      
      end
      puts
    end
    print (" 0  1  2  3  4  5  6 ")
    puts
  end
  
  def add_to_board(col, piece)
    @board[@colhash[col]][col] = " " + piece + " "
    @colhash[col]-=1
      
  end
  ####Check win
  def win?
      
  end
  
  def check_column(col)
    if @colhash[col] >= 0 && col.between?(0, 6)
      return true
    else
      return false
    end
    
  end
  ####Validation
  
  def check_full_board?
      
  end
    
  def check_full_row?
      
  end
        
  
    
end