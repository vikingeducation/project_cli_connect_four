require_relative 'board.rb'
require_relative 'player.rb'


class ConnectFour
   
  def initialize
  	@player_1 = Player.build_human_player("red")
    @board = Board.new
    @current_player = @player_1
  end


  def ask_player_type
    
    input = ""
    until ["computer","human"].include?(input)  
    	print "Second player is human or computer? :"
    	input = gets.chomp

    	input == "computer"? (@player_2 = Player.build_computer_player("green")): (@player_2 = Player.build_human_player("green"))               
    end
  end


  def switch_player
    if @current_player == @player_1
      @current_player == @player_2
    else
      @current_player == @player1
    end
  end


  def player_move(current_player)
    puts "====================================================="
    puts "  Please enter the coordinates of your move."
    puts "  The format should be [x,y], but each row and"
    puts "  column has a 0th item, so keep that in mind."
    puts "  (Think like a programmer, please)"
    puts "  For example, [5,0] would place a piece"
    puts "  in the bottom-left corner."
    puts "====================================================="
    puts "#{current_player.color} player enter your move:"
    
    move = gets.chomp

    until move =~ /\[[0-5].[0-6]\]/
      puts "Move in invalid format!, Re-Enter: "
      move = gets.chomp
    end 	  

    return move

  end

  def add_move(move,color)
  	move_array = move[1..3].split(',').collect! {|n| n.to_i}
  	
 	@board.game_board[move_array[0]][move_array[1]] = color

  end

  def play
    print_instructions
    ask_player_type
    @board.render

    move = player_move(@current_player)
    add_move(move,@current_player.color)
    @board.render
    # prompt player for move
    # validate_move
    # add_move
    # if check_winning_move
    #   quit

  end

  def print_instructions
    puts "====================================================="
    puts " Welcome to Connect Four! The object of the game"
    puts " is to get four pieces in a row. Your pieces can"
    puts " be vertical, horizontal, or diagonal."
    puts "====================================================="
  end



end	

game = ConnectFour.new
game.play