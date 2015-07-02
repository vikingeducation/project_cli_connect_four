
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
        pieces << check_continuous_pieces (bottom_row, column)
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
  
  def check_continuous_pieces(row, column)
    piece = @current_board[row][column]
    counter = 1
    #counting in down on the board (not array number) direction

    2.times do |x|
       x += 1
      if !(@current_board[row + x]).nil?  && @current_board[row + x][column] == piece
      counter += 1
      else
      break
      end
    end

    if counter == 3
       check_empty_slots
    end

    return false
  end

  def check_empty_slots
     
  end
end
  
