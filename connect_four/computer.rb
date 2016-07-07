class Computer < Player

  def initialize(color)
    super
    @name = "Computer"
  end

  def player_input
    (1..7).to_a.sample
  end

end
