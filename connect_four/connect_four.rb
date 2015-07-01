=begin

Initialize game [ConnectFour]
Create empty board [Board]
Create Player [Player]

loop until game conditions met
	Render board [Board]
	Get player move [Player]
	Add move to board [Board]
	Check game end conditions [Board]

=end


class ConnectFour

  def initialize

    @player1 = Human.new
    @player2 = Human.new 

    @board = Board.new

  end


  def play
    # print_instructions

    @board.render




  end

end



class Board

  def initialize

    @game = Array.new(6) { Array.new(7) { 0 }  }

    # @game = [
    #           [0,0,0,0,0,0,0],
    #           [0,0,0,0,0,0,0],
    #           [0,0,0,0,0,0,0],
    #           [0,0,0,0,0,0,0],
    #           [0,0,0,0,0,0,0],
    #           [0,0,0,0,0,0,0],
    #           [0,0,0,0,0,0,0]
    #         ]


  end

  def render

    @game.each {|i| p i }

  end

end



class Player




end



class Human < Player

  def get_move

    puts "Some intructions"
    #
    move = gets.chomp

  end

end


c4 = ConnectFour.new

c4.play