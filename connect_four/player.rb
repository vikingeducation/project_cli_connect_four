class Player
    
  def initialize(piece, board)
    @piece = piece
    @board = board
  end

  
    
  def get_move
    move = ask_for_move    
  end
  
  def ask_for_move
    puts "Put piece in column 0-6 " + "(Player #{@piece})" 
    col = gets.to_i
    
    if valid_input?(col)
      puts "valid"
      add_piece(col)
    else
      puts "invalid"  
    end
      
    
  end
  
  def add_piece(col)
    @board.add_to_board(col,@piece)    
  end
    
  def valid_input?(col)
    @board.check_column(col)  
  end
end