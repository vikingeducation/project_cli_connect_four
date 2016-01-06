class Logic

  def initialize
  end


0,0   0,1   0,2   0,3   0,4   0,5    0,6
1,0   1,1   1,2   1,3   1,4   1,5    1,6
2,0   2,1   2,2   2,3   2,4   2,5    2,6
3,0   3,1   3,2   3,3   3,4   3,5    3,6
4,0   4,1   4,2   4,3   4,4   4,5    4,6
5,0   5,1   5,2   5,3   5,4   5,5    5,6

  def backward_diagonals(array)

      ROWS.times do |index|
        col = row 
        new_array << @board.game_baord[ROW][col]

      end  
    
  end  
  def straight_win?(array,row,col,direction,color)
    if direction == "horizontal"
       horizontal_win?(array[row],color)
     else 
       horizontal_win?(array.collect {|row| row[col]},color)
    end  
  end
    
  def horizontal_vertical_win?(array, color)
    # [0 1 2 3 4 5 6]
    # [r r g g r r r ]
    consecutive = 0
    array.each_with_index do |column, index|
      if array[index] == color
        consecutive += 1
        return true if consecutive == 4
      else
        consecutive = 0
      end
    end
    false
  end


  def vertical
  end


  def diagonal
  end





end