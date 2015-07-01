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
    @player1_color = "R"
    @player2_color = "B"
    @game = Board.new

  end
  
  def play
    choose_opponent
    
    loop do

      @game.render

      # 1.render
      # 2. ask move
      # 3. make move if false?
      # 4. ask move
      # 5. make move

      # next if @game.make_move(move, @player1_color) == false 
      #   move = @player1.turn
      # end

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

  def turn

    puts "Where do you want to drop your piece (column from right)"
    column = gets.chomp.to_i


  end

end

class Computer

end

class Board

  attr_accessor :current_board

  def initialize

    @current_board = Array.new(6) { Array.new(7) {"O"} }

  end

  def render
    
    system "clear"
    puts "\n Current Board"

    @current_board.each do |line|
      line.each do |space|
        print space
      end
      print "\n"
    end
    
  end

  def make_move(column, color)

    row = bottom_empty_row(column)

    if row == false
      puts "The column is full. Choose another one."
      return false
    else 
      @current_board[column][row] = color
    end

  end

  def bottom_empty_row (column)

    5.downto(0) do |i|
      if @current_board[i][column] == "O"
        return i
      end
    end

    return false

  end

end