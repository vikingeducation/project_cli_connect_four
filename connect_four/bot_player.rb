# require './player.rb'

class BotPlayer < Player
  def choose_column
    (rand(7) + 1)
  end 
end