class Dealer
  attr_reader :name


  def initialize(attrs)
    @name = attrs[:name]
  end


  def player_choice(sum)
    if sum < 17
      "hit"
    else
      "stand"
    end
  end


end