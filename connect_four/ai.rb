class Ai
  attr_reader :name, :symbol
  def initialize name, symbol
    @name = name
    @symbol = symbol
  end

  def make_move
    rand(1..7)
  end
end