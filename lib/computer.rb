require_relative 'player.rb'

class Computer < Player
  def initialize
    @name = "AI"
  end

  def choose_color
  	@team_color = ["red","black"].sample
  end

  def choose_column
    ai_random
  end

  def ai_random
    (0..6).to_a.sample
  end

  def ai_super_awesome
    # needs to be created
  end
end
