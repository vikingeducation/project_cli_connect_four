class Human < Player
  def initialize

  end

  def choose_color
  	print "Do you want to be red or black?: "
  	 choose_color unless @team_color = COLOR_OPTIONS[gets.chomp.to_sym]
  end

  def choose_column
    print "#{@team_color.to_s.capitalize}, which column do you want to place your piece? (1-7): "
    column = gets.chomp.to_i - 1
    if !(0..6).include? column
      puts "Your guess is invalid."
      choose_column
    else
      column
    end
  end
end
