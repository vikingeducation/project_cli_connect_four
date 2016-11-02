class Player
  attr_reader :color

  # instantiate with color
    # red player
    # black player
  def initialize(color)
    @color = color
  end

  # controlling where you can put pieces
    # talks to board to figure this out
end

p = Player.new(:red)
puts p.color

# Later on  
# HumanPlayer < Player
# ComputerPlayer < Player