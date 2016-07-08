# computer.rb

class Computer < Player

  def get_name
    "Hal"
  end

  private

  def get_move
    [(0..6).to_a.sample, piece]
  end




end