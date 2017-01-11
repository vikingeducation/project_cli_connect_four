class Player
  attr_accessor :player_name

  def initialize
    @player_name = Gui.get_name
  end
end

class HumanPlayer < Player
  def choose
    Gui.annouce_who(player_name)
    Gui.get_player_choice
  end
end

class CpuPlayer < Player
  def initialize
    @player_name = "CPU"
  end
end
