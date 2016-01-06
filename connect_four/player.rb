class Player
  attr_accessor :team_color

  def initialize
    @team_color = choose_color
  end

  def choose_color
  	puts "Do you want to be red or black?"
  	gets.chomp
  end

  def choose_column
    puts "#{@team_color.to_s.capitalize}, which column do you want to place your piece? (1-7)"
    column = gets.chomp.to_i
  end
end