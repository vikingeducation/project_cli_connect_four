
=begin

  check if you have 3 pieces in a row
    if the space next to it is empty
      place piece there
  
  check the if opponent has 3 pieces in a row
    if the space next to it is empty
      place piece there

  else check if you have 2 pieces in a row
     if the space next to it is empty
      place piece there

  block
=end


class ComputerAi
  def intialize (gameboard)
    @current_board = gameboard
  end

  def max_block
    
    7.times do |column|
      bottom_row = bottom?(column)
      if bottom == false
        pieces << 0
      else
        pieces << max_direction_values (bottom_row, column)
      end
    end

    #pieces [2, 3, 0, 1, 1, 0, 0]
    return pieces.index(pieces.max)

  end

  def bottom?(column)

    5.downto(0) do |row|
      if @current_board[row][column] == "-"
        return row
      end
    end

    return false

  end
  
  def max_direction_values(row,column)

      max_direction = [vertical_check(row,column),horizontal_check(row,column),diagonal_right_check(row,column),diagonal_left_check(row,column)]

      max
     
  end

  def vertical_check(row, column)
    position = @current_board[row][column]
    piece = 'R'

    counter = 0
    #counting in down on the board (not array number) direction

    3.times do |x| #4,0
       x += 1
      if !(@current_board[row + x]).nil?  && @current_board[row + x][column] == piece
      counter += 1
      else
      break
      end
    end
    
    return counter

  end

  def horizontal_check(row, column)
    position = @current_board[row][column]
    piece = 'R'

     counter = 0
    #counting in down on the board (not array number) direction

    3.times do |x|
      x += 1
      if !(@current_board[row][column + x]).nil?  && @current_board[row][column + x] == piece
      counter += 1
      else
      break
      end
    end

    #counting in left direction

    3.times do |x|
      x += 1
      if !(@current_board[row][column - x]).nil? && @current_board[row][column - x] == piece
      counter += 1
      else
      break
      end
    end
    
    return counter 

  end

    def diagonal_right_check(row, column)
    position = @current_board[row][column]
    piece = 'R'

     counter = 0
    #counting in down on the board (not array number) direction

    3.times do |x|
      x += 1
      if !(@current_board[row - x]).nil? && !(@current_board[row - x][column + x]).nil? && @current_board[row - x][column + x] == piece
      counter += 1
      else
      break
      end
    end

    #counting down in the left direction

    3.times do |x|
      x += 1
      if !(@current_board[row + x]).nil? && !(@current_board[row + x][column - x]).nil? && @current_board[row + x][column - x] == piece
      counter += 1
      else
      break
      end
    end
    
    return counter 

  end
  
  def diagonal_left_check(row, column)
    position = @current_board[row][column]
    piece = 'R'

     counter = 0
    #counting in down on the board (not array number) direction

    3.times do |x|
      x += 1
      if !(@current_board[row - x]).nil? && !(@current_board[row - x][column - x]).nil? && @current_board[row - x][column - x] == piece
      counter += 1
      else
      break
      end
    end

    #counting down in the right direction

    3.times do |x|
      x += 1
      if !(@current_board[row + x]).nil? && !(@current_board[row + x][column + x]).nil? && @current_board[row + x][column + x] == piece
      counter += 1
      else
      break
      end
    end
    
    return counter 

  end

end
  
