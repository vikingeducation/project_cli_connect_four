require_relative 'player.rb'

class Human < Player
  def initialize
    @name = ask_name
  end

  def ask_name
    print "What is your name? "
    gets.chomp
  end

  def choose_color
  	print "#{@name}, do you want to be red or black?: "
  	choose_color unless @team_color = COLOR_OPTIONS[gets.chomp.to_sym]
    puts "#{@name} has chosen #{@team_color}."
  end

  def choose_column
    print "#{@name}, which column do you want to place your piece? (1-7): "
    column = gets.chomp.to_i - 1
    if !(0..6).include? column
      puts "Your guess is invalid."
      choose_column
    else
      column
    end
  end
end
