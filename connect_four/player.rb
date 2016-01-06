class Player
	attr_accessor :symbol, :column

  def choose_symbol
  	puts "Do you want to be 'x' or 'o'"
  	@symbol = gets.chomp.upcase
  end

  def choose_column
    puts "Which column do you want to place your piece? (1-7)"
    @column = gets.chomp.to_i - 1
  end
 
end