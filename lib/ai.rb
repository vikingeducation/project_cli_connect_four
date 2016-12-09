require_relative 'board'
require_relative 'player'
require 'pry'

class AI < Player
  
  def choose_column

    player_choice = rand(1..7)
    until valid_choice? (player_choice)
      player_choice = rand(1..7)
    end
    puts "Player #{@number} chose column #{player_choice}!"
    @board.process_choice(player_choice, @piece)
  end


  def valid_choice?(player_choice)
    return true if (1..7).include?(player_choice) &&
                    @board.columns[player_choice - 1].include?('-')
    false
  end

end