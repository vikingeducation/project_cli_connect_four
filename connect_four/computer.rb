# computer.rb

=begin
Class: Computer < Player
  get_name

  private:
  get_move
=end

class Computer < Player

  def get_name
    "Hal"
  end

  private

  def get_move
    [(0..6).to_a.sample, piece]
  end




end
