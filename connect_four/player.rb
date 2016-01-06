class Player
	attr_accessor :symbol

  def choose_symbol(player)
  	puts "Do you want to be 'x' or 'o'"
  	@symbol = gets.chomp.upcase.to_sym
  end

  def choose_column
    puts "Which column do you want to place your piece? (1-7)"
    column = gets.chomp.to_sym
  end
  
end