class Player
  attr_reader :name
  def initialize(name, color, board)
    @name = name
    @color = color
    @board = board
  end
end