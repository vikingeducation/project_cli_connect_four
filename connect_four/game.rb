require_relative 'human_player'
require_relative 'computer_player'

class Game
  def greeting
    puts "**Welcome to Connect Four!"
    puts "Enter 1 for a one player game or 2 for a two player game."
  end

  def create_players
    game_type = gets.chomp.to_i
    if game_type == 1
      player_1 = HumanPlayer.new
      player_2 = ComuterPlayer.new
    else
      player_1 = HumanPlayer.new
      player_2 = HumanPlayer.new
    end
  end
end