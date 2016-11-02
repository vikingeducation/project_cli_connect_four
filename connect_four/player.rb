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

# Later on  
# HumanPlayer < Player
# ComputerPlayer < Player