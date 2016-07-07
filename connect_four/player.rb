class Player
  attr_reader :name

  def initialize(name, piece)
    @name = name
    @piece = piece
  end

  def take_turn
      column = get_column
  end

end