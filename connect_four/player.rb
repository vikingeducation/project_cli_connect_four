class Player

  def choose_color(player)
  	puts "Do you want to be red or black?"
  	@team = gets.chomp.to_sym
  end
end