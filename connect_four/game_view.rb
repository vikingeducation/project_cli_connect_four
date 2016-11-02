
class GameView

  def self.welcome(game_name, instructions)
    puts "Welcome to #{ game_name }!"
    puts instructions
  end

  def self.print_player_move_prompt
  	print "Enter a column 1-7: "
  end

end
