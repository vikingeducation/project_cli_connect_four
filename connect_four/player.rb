class Player
  
  attr_accessor :color, :pid
  
  def initialize( color, pid )
    @color = color
    @pid = pid
  end
  
  def get_move
    puts ""
    puts "Player #{@pid}: enter the column number (1 - 6) where you'd like to place your piece."
    
    move = gets.chomp.to_i
    until (1..6).include?( move )
      puts "Try again!"
      move = gets.chomp.to_i
    end
    
    move = move - 1
    move
  end
  
end