require "player"

class Dealer < Player
  def initialize
    @name = "Dealer"
    super
  end

  def get_new_card?
     (16 > hand_sum)
  end
end
