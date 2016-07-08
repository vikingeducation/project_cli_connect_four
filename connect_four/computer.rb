# computer.rb

class Computer < Player

  def initialize(piece, position)
    @name = get_name
    @piece = piece
    @position = position
  end

  def get_name
    "Hal"
  end

  private

  def get_move
    [(0..6).to_a.sample, piece]
  end




end