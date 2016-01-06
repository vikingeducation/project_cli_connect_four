class Player
  attr_accessor :team_color

  def initialize
    
  end

  def choose_color
  	print "Do you want to be red or black?: "
  	@team_color = gets.chomp
  end

  def choose_column
    print "#{@team_color.to_s.capitalize}, which column do you want to place your piece? (1-7): "
    gets.chomp.to_i - 1
  end
end