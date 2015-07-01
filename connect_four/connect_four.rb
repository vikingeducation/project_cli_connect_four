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
    @board.move(@player1.get_move)
    @board.render

  end

end



class Board

  def initialize

    @game = Array.new(7) { Array.new(6) { 0 }  }


  end


  def render

    temp = @game.transpose
    temp.each {|i| p i }

  end


  def move(num)

    row = @game[num].detect {|i| i != 0}
    if row.nil?
      @game[num][-1] = 1
    end

  end


end



class Player




end



class Human < Player


  def get_move

    puts "Some intructions"
    #
    loop do
      move = gets.chomp.to_i - 1

      if (0..6).include?(move)
        return move
      else
        puts "Invalid move"
      end
    end

  end

end


c4 = ConnectFour.new

c4.play