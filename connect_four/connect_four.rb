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


    current_player = @player1
    @num = 1

    loop do
      @board.render
      puts "Player #{@num} turn"
      @board.move(current_player.get_move, @num)
      if @board.victory?
        @board.render
        puts "Player #{@num} Wins!"
        break
      end
      switch_player(current_player)
    end

  end

  def switch_player(current_player)

    if @num == 1

      @num = 2
    else
      @num = 1

    end

    if current_player == @player1
      current_player = @player2
    else
      current_player = @player1
    end

  end

end



class Board

  def initialize

    @game = Array.new(7) { Array.new(6) { 0 }  }


  end


  def render

    display = @game.transpose
    display.each {|i| p i }
    puts " --------------------"
    7.times { |i| print "-"; print (i + 1 ); print ("-")}
    puts
    
    puts

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

    vert_victory? || horz_victory? || diag_victory?
      

  end

  def horz_victory?



    @game.each do |row|

      3.times do |i|

        # puts i
        # puts row

        if row[i]   == row[i+1] &&
           row[i+1] == row[i+2] &&
           row[i+2] == row[i+3] &&
           row[i]   != 0


          return true
  

        end
      end



    end

  return false

  end

  def vert_victory?

    
  
    @game.transpose.each do |row|

      4.times do |i|

        # puts i
        # puts row

        if row[i]   == row[i+1] &&
           row[i+1] == row[i+2] &&
           row[i+2] == row[i+3] &&
           row[i]   != 0

          return true
        
        end
      end

      

    end
    return false

  end


  def diag_victory?


    i = 0
    4.times do |vert|
      3.times do |horz|

        if @game[vert + i]    [horz + i]     == @game[vert + i + 1][horz + i + 1] &&
           @game[vert + i + 1][horz + i + 1] == @game[vert + i + 2][horz + i + 2] &&
           @game[vert + i + 2][horz + i + 2] == @game[vert + i + 3][horz + i + 3] &&
           @game[vert + i]    [horz+ i]      != 0


          puts "diag victory!"
          i+1
          return true
        end


      end

    end

    i = 0


    4.times do |vert|
      3.times do |horz|

        if @game.reverse[vert + i]    [horz + i]     == @game.reverse[vert + i + 1][horz + i + 1] &&
           @game.reverse[vert + i + 1][horz + i + 1] == @game.reverse[vert + i + 2][horz + i + 2] &&
           @game.reverse[vert + i + 2][horz + i + 2] == @game.reverse[vert + i + 3][horz + i + 3] &&
           @game.reverse[vert + i]    [horz+ i]      != 0


          puts "diag2 victory!"
          i+1
          return true
        end

      end

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