class Computer < Player
  attr_reader :name, :color

  def initialize(color)
    @color = color
    @name = "Computer"
  end

  def player_input
    (1..7).to_a.sample
  end

end
