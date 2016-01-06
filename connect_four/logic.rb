require_relative 'board.rb'

class Logic

  def initialize
    @board = Board.new
  end


# 0,0   0,1   0,2   0,3   0,4   0,5    0,6

# 1,0   1,1   1,2   1,3   1,4   1,5    1,6

# 2,0   2,1   2,2   2,3   2,4   2,5    2,6

# 3,0   3,1   3,2   3,3   3,4   3,5    3,6

# 4,0   4,1   4,2   4,3   4,4   4,5    4,6

# 5,0   5,1   5,2   5,3   5,4   5,5    5,6



# user move: [2,4]

  def backslash_diagonals(array, color, move)

    backslash_options = [
      [[2,0], [3,1], [4,2], [5,3]],
      [[1,0], [2,1], [3,2], [4,3], [5,4]],
      [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5]],
      [[0,1], [1,2], [2,3], [3,4], [4,5], [5,6]],
      [[0,2], [1,3], [2,4], [3,5], [3,6]],
      [[0,3], [1,4], [2,5], [3,6]]
    ]

    backslash_options.each do |diagonal|
      # user's move is in potential diagonal
      arr = []

      if diagonal.include? move  # move
        #get the actual colors from the game board based on
        #positional array
        diagonal.each do |item|
          arr << array[item[0]][item[1]]
        end
        
        # check if 4 consecutive items in diagonal are the same
        return true if horizontal_vertical_win?(arr, color) 
      end
    end
    return false
  end
 
  def forwardslash_diagonals(array, color,move)

    forwardslash_options = [
      [[3,0], [2,1], [1,2], [0,3]],
      [[4,0], [3,1], [2,2], [1,3], [0,4]],
      [[5,0], [4,1], [3,2], [2,3], [1,4], [0,5]],
      [[5,1], [4,2], [3,3], [2,4], [1,5], [0,6]],
      [[5,2], [4,3], [3,4], [2,5], [1,6]],
      [[5,3], [4,4], [3,5], [2,6]]
    ]

    forwardslash_options.each do |diagonal|
      # user's move is in potential diagonal
      arr = []

      if diagonal.include? move  # move
        #get the actual colors from the game board based on
        #positional array
        diagonal.each do |item|
          arr << array[item[0]][item[1]]
        end
        
        # check if 4 consecutive items in diagonal are the same
        return true if horizontal_vertical_win?(arr, color) 
      end
    end
    return false
  end
 

  def straight_win?(array,user_row,user_col,color)
    # check horizontal rows
    horizontal_vertical_win?(array[user_row],color)
    # check vertical rows
    horizontal_vertical_win?(array.collect {|row| row[user_col]},color)  
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

move = [2,4]
arr =   [[nil,"r","g","r","r","r","r"],
         ["r","r","g",nil,"r","r","r"],
         ["g","r","g","r","r","r","r"],
         ["g","r","g",nil,"r","r","r"],
         ["g","r","g","r","r",nil,"r"],
         ["r",nil,"g","r","r","r","r"],
         ["r","r","g","r","r","r","r"],
         ["r","r","g","r","r","r","r"]]

l = Logic.new
puts l.forwardslash_diagonals(arr, "r",[2,4])