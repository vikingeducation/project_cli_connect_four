
# Your code here!

class ConnectFour
   
  def initialize
  	@player_1 = Player.build_human_player("red")
  end


  def ask_player_type
    
    input = ""
    until ["computer","human"].include?(input)  
    	print "Second player is human or computer? :"
    	input = gets.chomp

    	input == "computer"? (@player_2 = Player.build_computer_player("green")):\
    	                     (@player_2 = Player.build_human_player("green"))               
    end
  end

  def ask_player_type
    
    input = ""
    until ["computer","human"].include?(input)  
    	print "Second player is human or computer? :"
    	input = gets.chomp

    	input == "computer"? (@player_2 = Player.build_computer_player("green")):\
    	                     (@player_2 = Player.build_human_player("green"))               
    end
  end
end

 2 players
 color for player is assigned
 board = Array.new(6){Array.new(7)}

 render board
 prompt player for move
 validate_move
 add_move
 if check_winning_move
 	quit
end
end	