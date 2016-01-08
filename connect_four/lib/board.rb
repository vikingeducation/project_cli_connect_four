require 'rainbow'


class Board

  COLS = 7
  ROWS = 6

  BACKWARD_DIAGONALS = [
    [[2,0], [3,1], [4,2], [5,3]],
    [[1,0], [2,1], [3,2], [4,3], [5,4]],
    [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5]],
    [[0,1], [1,2], [2,3], [3,4], [4,5], [5,6]],
    [[0,2], [1,3], [2,4], [3,5], [4,6]],
    [[0,3], [1,4], [2,5], [3,6]]
  ]

  FORWARD_DIAGONALS = [
    [[3,0], [2,1], [1,2], [0,3]],
    [[4,0], [3,1], [2,2], [1,3], [0,4]],
    [[5,0], [4,1], [3,2], [2,3], [1,4], [0,5]],
    [[5,1], [4,2], [3,3], [2,4], [1,5], [0,6]],
    [[5,2], [4,3], [3,4], [2,5], [1,6]],
    [[5,3], [4,4], [3,5], [2,6]]
  ]
  

  attr_accessor :game_board


  def initialize
    @game_board = Array.new(ROWS){Array.new(COLS)}
  end


  
  def render
    puts " 0  1  2  3  4  5  6"
	  @game_board.each do |row|
      row.each do |piece|
        if piece.nil? 
          print " 0 "
        elsif piece == "red"
          print Rainbow(" #{piece[0,1].upcase} ").red
        else
          print Rainbow(" #{piece[0,1].upcase} ").green
        end
      end
      puts
    end
  end


  
  def get_move_array(move_col)
    # make sure slot is empty (nil)
    (ROWS - 1 ).downto(0) do |row|
      if @game_board[row][move_col].nil?
        return [row,move_col]
      end
    end
    false
  end
   


  def atleast_one_row_empty?(move_col)
    # make sure slot is empty (nil)
    @game_board[0][move_col].nil? 
  end 


  # TODO: refactor this method to be better, and to return false if there's no win
  def straight_win?(array,move,color)
    
    user_row = move[0]
    user_col = move[1]

    # check horizontal rows
    return true if horizontal_vertical_win?(array[user_row],color)
    # check vertical rows
    return true if horizontal_vertical_win?(array.collect {|row| row[user_col]},color)  
    #check backslash diagonals
    return true if check_diagonals(BACKWARD_DIAGONALS,array, color, move)
    #check forwardslash diagonals
    return true if check_diagonals(FORWARD_DIAGONALS,array, color, move)
  end



  def check_board_full?
    game_board.each do |row|
      unless row.any?(&:nil?)
        return true
      end
    end
    false
  end


  def check_board_empty?
    @game_board.each do |row|
      unless row.all?(&:nil?)
        return false
      end
    end
    true
  end
    


  # private
  def check_diagonals(diagonal_array,array,color,move)

    diagonal_array.each do |diagonal|
      arr = []

      # user's move is in potential diagonal
      if diagonal.include? move
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

  

  def horizontal_vertical_win?(array, color)
    consecutive = 0
    array.each_with_index do |coin, index|
      if array[index] == color
        consecutive += 1
        return true if consecutive == 4
      else
        consecutive = 0
      end
    end
    false
  end


end	