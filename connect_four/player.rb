
class Player
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def get_input(board)
    loop do
      input = ask_for_input
      if valid_input?(input, board)
        return input
        break
      end
      puts "Invalid Input"
    end
  end

  def ask_for_input
    puts "Where do you want to move your piece #{name} (columns 1-7) ?"
    gets.chomp.to_i
  end

  def valid_input?(input, board)

    !board.column_full?(input-1)
  end


end
