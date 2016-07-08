class Piece
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def empty?
    return false
  end


end