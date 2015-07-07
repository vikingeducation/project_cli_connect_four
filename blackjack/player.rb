class Player
  attr_accessor :hand_value
  
  def initialize
    @hand_value = nil  
  end
    
end



class Human < Player

  def hit_or_stand(table)
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



class Dealer < Player

  def hit_or_stand(table)
    if default_stand_includes_ace?(table)
      return "h"
    elsif default_stand?(table)
      return "s"
    else
      return "h"
    end
  end


  def default_stand?(table)
    if table.total_hand >= 17
      return true
    end
  end


  def default_stand_includes_ace?(table)
    if table.aces_in_hand? && table.total_hand == 17
      true
    end
  end

end