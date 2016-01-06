class Player
  attr_accessor :team_color

  def initialize
    @team_color = choose_color
  end

  def choose_color(player)
  	puts "Do you want to be red or black?"
  	gets.chomp.to_sym
  end

  def choose_column
    puts "Which column do you want to place your piece? (1-7)"
    column = gets.chomp.to_sym
  end
end