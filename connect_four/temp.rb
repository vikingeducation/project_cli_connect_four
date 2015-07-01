
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
    @gameboard = gameboard
  end
  
  def computer_check_three(row, column)
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
  
