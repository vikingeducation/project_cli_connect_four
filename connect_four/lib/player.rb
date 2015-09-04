# players should require a piece to initialize
# human players should gets a name
# AI players will have a random name, won't test these just mock out response
# get_move

class Player
  attr_reader :name, :piece

  def initialize(piece)
    @piece = piece
  end
  
end



class Human < Player

  def initialize(piece)
    super(piece)
  end


  def get_name
    print "What's your name, player? > "
    @name = gets.chomp
  end


  def get_move(board)
    print "#{@name}, enter a column (1-7) > "
    loop do
      input = gets.chomp.to_i
      break if valid_input_format?(input) &&
              board.add_piece(input, @piece)
    end
  end

  private


    def valid_input_format?(input)
      if (1..7).include?(input)
        return true
      else 
        puts "Please enter a number between 1 and 7"
      end
    end
  
end



class AI < Player

  def initialize(piece)
    super(piece)
    @name = ["HAL", "The Computer", "Siri"].sample
  end

  
  def get_move(board)
    winning_move = block_or_win(:y, board)
    blocking_move = block_or_win(:r, board)
    move = winning_move || blocking_move || (1..7).to_a.sample
    board.add_piece(move, @piece)
  end


  private

    def block_or_win(piece, board)
      1.upto(7) do |col_number|
        test_board = Marshal::load(Marshal.dump(board))
        test_board.add_piece(col_number, piece)
        if test_board.winning_line?(piece)
          return col_number
        else
          next
        end
      end
      return false
    end
    
end

