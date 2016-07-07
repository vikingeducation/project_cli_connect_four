class Computer
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
      
    end
  end

  def ask_for_input
    rand(7) + 1
  end

  def valid_input?(input, board)

    !board.column_full?(input-1)
  end

end