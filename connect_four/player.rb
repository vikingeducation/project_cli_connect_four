class Player

  def choose_color(player)
  	puts "Do you want to be 'x' or 'o'"
  	@team = gets.chomp.upcase.to_sym
  end

  def choose_column
    puts "Which column do you want to place your piece? (1-7)"
    column = gets.chomp.to_sym
  end
  
end