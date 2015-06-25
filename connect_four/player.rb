class Player
  def initialize(piece_color)
    @piece = piece_color
  end
  
end

class Human < Player

  def get_move
    print "Enter a column (1-6) > "
    loop do
      input = gets.chomp
      if valid_input_format?(input)
        if board.add_piece(input, @piece)
          break
        end
      end
    end
    # print input thing
    # loop
    # break loop if input valid
    # check with the board to see if the move is valid & add to board
  end

  def valid_input_format?(input)
    if (1..6).include?(input.to_i)
      return true
    else 
      puts "Please enter a number between 1 and 6"
    end
  end
  
end

class AI < Player
  
  def get_move
    # return a move based on some logic
    # probably random to begin with
    
  end
end

