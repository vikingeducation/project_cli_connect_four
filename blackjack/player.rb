class Player

  def hit_or_stand
    puts "Player do you want to hit or stand?"
    print "Enter 'h' for hit, 's' for stand, 'q' to quit > "
    loop do
      input = gets.chomp.downcase
      if valid_hit_or_stand_input?(input)
        return input
      end
    end
  end

  def valid_hit_or_stand_input?(input)
    if ["h", "s", "q"].include?(input)
      return true
    else
      print "Please enter 'h', 's', or 'q' > "
    end
  end
end