
class GameView

  def self.welcome(game_name, instructions)
    puts
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

  def self.end_message(win)
    puts
    puts win ? "Congratulations, that's four in a row!!" : "Tie game."
    puts
  end

  def self.print_play_again_prompt
    print "Play again? (y/n): "
  end
end
