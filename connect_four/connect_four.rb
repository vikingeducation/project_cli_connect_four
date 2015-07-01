=begin
  -Main class for controlling flow of the game
      -method for picking opponent
      -method for victory?
      -method for looping the turns until victory?
  -Human player class
  -Computer player class
  -Board class for controlling the game board
      -render board display
=end

class ConnectFour
  def initalize
    @player1 = Human.new
    @game = Board.new
  end
  
  def play
    choose_opponent
    
    loop do
      @game.render


    end

  end

  def choose_opponent
    puts "Would you like to play vs human (h) or computer? "
    
    if gets.chomp.downcase == "h"
      @player2 = Human.new
    else
      @player2 = Computer.new
    end

  end

end

class Human

end

class Computer

end

class Board

  def render
    
  end

end