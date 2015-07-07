class Player

  attr_accessor :hand_value, :hand

  include Helper

  def initialize(hand)
    @hand = hand
  end
    
end



class Human < Player

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


  private


    def valid_hit_or_stand_input?(input)
      if ["h", "s", "q"].include?(input)
        return true
      else
        print "Please enter 'h', 's', or 'q' > "
      end
    end
  
end



class Dealer < Player

  def hit_or_stand
    if default_stand_includes_ace?
      return "h"
    elsif default_stand?
      return "s"
    else
      return "h"
    end
  end


  private


    def default_stand?
      if @hand_value >= 17
        return true
      end
    end


    def default_stand_includes_ace?
      if aces_in_hand?(@hand) && @hand_value == 17
        true
      end
    end

end