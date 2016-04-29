=begin
  public : make_move
=end

class Ai < Player
  def make_move
    rand(1..7)
  end
end