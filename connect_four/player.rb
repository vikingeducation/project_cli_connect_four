
class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def get_input(board)
    loop do 
      input = ask_for_input
      return input if valid_input?(input, board)
    end
  end

  def ask_for_input
    puts "Where do you want to move your piece (columns 1-7) ?"
    gets.chomp.to_i
  end

  def valid_input?(input, board)
    !board.column_full?(input)
  end

  
end
