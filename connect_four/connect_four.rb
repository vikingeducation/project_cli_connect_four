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

    current_player = 1
    loop do
      @board.move(@player1.get_move, 1)

      system "clear"
      @board.render
      @board.victory?


    end

  end

end



class Board

  def initialize

    @game = Array.new(7) { Array.new(6) { 0 }  }


  end


  def render

    display = @game #.transpose
    display.each {|i| p i }

  end


  def move(num,player)

    row = @game[num].detect {|i| i != 0}
    if row.nil?
      @game[num][-1] = player
    else
      @game[num][@game[num].index(row) - 1] = player

    end

  end

  def victory?

    #vert_victory? || horz_victory? || diag_victory?
    diag_victory?
      

  end

  def horz_victory?

    puts "horz_test"

    @game.each do |row|

      3.times do |i|

        # puts i
        # puts row

        if row[i]   == row[i+1] &&
           row[i+1] == row[i+2] &&
           row[i+2] == row[i+3] &&
           row[i]   != 0

          puts "hi"
          return true
  

        end
      end



    end

  return false

  end

  def vert_victory?

    puts "vert test"


  
    @game.transpose.each do |row|

      4.times do |i|

        # puts i
        # puts row

        if row[i]   == row[i+1] &&
           row[i+1] == row[i+2] &&
           row[i+2] == row[i+3] &&
           row[i]   != 0

          puts "win"
          return true
        
        end
      end

      

    end
    return false

  end


  def diag_victory?

    i = 0
    if @game[i][i]         == @game[i + 1][i + 1] &&
       @game[i + 1][i + 1] == @game[i + 2][i + 2] &&
       @game[i + 2][i + 2] == @game[i + 3][i + 3] &&
       @game[i][i]         != 0

      puts "diag victory!"
      return true
    end

    return false
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