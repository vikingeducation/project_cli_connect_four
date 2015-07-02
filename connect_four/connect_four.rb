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

    @player1 = Computer.new
    @player2 = Computer.new 

    @board = Board.new

  end


  def play
    print_instructions


    current_player = @player1
    @num = 1

    loop do
      @board.render
      puts "Player #{@num} turn"
      @board.move(current_player.get_move(@board), @num)
      if @board.victory?
        @board.render
        puts "Player #{@num} Wins!"
        break
      elsif @board.full?
        @board.render
        puts "It's a tie!"
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

  def print_instructions

    puts "Enter the column where you want to drop your piece"
    puts "Get 4 in a row to win!"

  end

end



class Board

  attr_reader :game

  def initialize

    @game = Array.new(7) { Array.new(6) { 0 }  }


  end


  def render

    system "clear"

    display = @game.transpose
    display.each {|i| p i }
    puts "---------------------"
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

  def full?

    @game.each do |i| 
      return false if i.include?(0) 

    end

    return true

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

          i+1
          return true
        end

      end

    end

    return false
  end  

end



class Player

  def valid_move?(board, move)

    (0..6).include?(move) && board.game[move].include?(0)

  end


end



class Human < Player


  def get_move(board)

    puts "Enter next move"
    #
    loop do
      until valid_move?(board, move = gets.chomp.to_i - 1)
        puts "Invalid move"
      end
      return move

      # if (0..6).include?(move)
      #   return move
      # else
      #   puts "Invalid move"
      # end
    end

  end

end


class Computer < Player 



  def check_for_win(board)

    temp = []

    puts temp.victory?

     7.times do |i|

      temp.game.move(i)
        if temp.victory?
          puts "winning move is"
          p i
        end

    end





    return nil
  end

  def get_move(board)

    check_for_win(board)

    until valid_move?(board, move = (0..6).to_a.sample)
    end
    return move

  end

end


c4 = ConnectFour.new

c4.play