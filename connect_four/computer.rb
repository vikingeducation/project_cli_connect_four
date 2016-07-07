class Computer
  attr_reader :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def get_input(board)
    loop do
      input = ask_for_input(board.grid)
      if valid_input?(input, board)
        return input
        break
      end

    end
  end

  def ask_for_input(grid)
    (0..6).to_a.reverse.each do |x|
      return x+1 if (grid[x].length == 0 || grid[x][-1] != "O") && grid[x].length !=6
    end
    return rand(7) + 1
  end

  def valid_input?(input, board)

    !board.column_full?(input-1)
  end

end
