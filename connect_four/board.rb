class Board
  
  attr_accessor :game_board

  @@COLS = 7
  @@ROWS = 6

  def initialize
    @game_board = Array.new(@@ROWS){Array.new(@@COLS)}
  end

  def render
	  @game_board.each do |row|
      row.each do |piece|
         piece == nil ? (print "  O  ") : (print "  #{piece[0,1].upcase}  ")
      end
      puts
    end
  end


  def get_move_array(move_col)
    # make sure slot is empty (nil)
    (@@ROWS - 1 ).downto(0) do |row|
      if @game_board[row][move_col] == nil
        return [row,move_col]
      end
    end
  end
   
  def atleast_one_row_empty?(move_col)
    # make sure slot is empty (nil)
    @game_board[0][move_col].nil? 
  end 

end	

b = Board.new
# b.valid_move?

# 0,0   0,1   0,2   0,3   0,4   0,5    0,6
# 1,0   1,1   1,2   1,3   1,4   1,5    1,6
# 2,0   2,1   2,2   2,3   2,4   2,5    2,6
# 3,0   3,1   3,2   3,3   3,4   3,5    3,6
# 4,0   4,1   4,2   4,3   4,4   4,5    4,6
# 5,0   5,1   5,2   5,3   5,4   5,5    5,6
