
class GameView

  def self.welcome(game_name, instructions)
    puts "Welcome to #{ game_name }!"
    puts
    puts instructions
    puts
  end

  def self.print_player_move_prompt(player)
  	print "Player #{player} enter a column 1-7: "
  end

  def self.print_invalid_input
    puts "Error. Invalid input."
    puts
  end
end
