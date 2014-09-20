# Your code here!

class Game
  def initialize
  end

  def rock
    "\u{270A}"
  end

  def paper
    "\u{270B}"
  end

  def scissors
    "\u{270C}"
  end

  def ai_move
    [rock, paper, scissors].sample
  end

  def play

    ai = ai_move

    get_player_input

    compare_fists

    display_results
  end
end

class Player
  def initialize
  end
end


