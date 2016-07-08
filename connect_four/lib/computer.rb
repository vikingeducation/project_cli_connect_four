=begin
  Public Methods
    initialize
      Computer should have a name and a piece
    name
      return name
    piece
      return piece
    get_input
      return an input which is an Integer and in valid range (1-7)

  Private Methods
    ask_for_input
    valid_input?

=end



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

  private

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
