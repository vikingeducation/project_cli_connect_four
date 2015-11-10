class Player
  attr_reader :name, :symbol

  def initialize(board, symbol)
    @board = board
    @symbol = symbol
  end

end
