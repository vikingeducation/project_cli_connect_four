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
require './computerai'

class ConnectFour

  def initialize
    @player1 = Human.new
    @player1_color = "R"
    @player2_color = "B"
    @game = Board.new

  end
  
  def play
    choose_opponent
    @game.render

    loop do

      player1_valid = false
      until player1_valid 
        puts "Player 1 Turn"
        player1_move = @player1.turn
        player1_valid =  @game.make_move(player1_move, @player1_color) 
       end

      @game.render
      if @game.win?
        puts "Player 1 wins"
        exit
      end
   
      player2_valid = false
      until player2_valid
        puts "Player 2 Turn"
        player2_move = @player2.turn
        player2_valid = @game.make_move(player2_move, @player2_color)
      end

      @game.render
      if @game.win?
        puts "Player 2 wins"
        exit
      end

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
    column = gets.chomp.to_i-1

  end

end

class Computer

  def turn
    column = (0..6).to_a.sample
  end

end

class Board

  attr_accessor :current_board

  def initialize

    @current_board = Array.new(6) { Array.new(7) {"-"} }

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
    
    @row = bottom_empty_row(column)

    if @row == false
      puts "The column is full. Choose another one."
      return false
    else 
      @current_board[@row][column] = color
      @column = column
    end

  end

  def bottom_empty_row (column)

    5.downto(0) do |row|
      if @current_board[row][column] == "-"
        return row
      end
    end

    return false

  end

  def win?
    p "Vertical " + vertical(@row, @column).to_s
    p "horizontal " + horizontal(@row, @column).to_s
    p "diagonal_right " + diagonal_right(@row, @column).to_s
    p "diagonal_left " + diagonal_left(@row, @column).to_s

    [vertical(@row, @column), horizontal(@row, @column), diagonal_right(@row, @column), diagonal_left(@row, @column)].any?

  end

  ###### Methods to check if true ########

  def vertical (row, column)
    piece = @current_board[row][column]
    counter = 1

    #counting in down on the board (not array number) direction

    3.times do |x|
       x += 1
      if !(@current_board[row + x]).nil?  && @current_board[row + x][column] == piece
      counter += 1
      else
      break
      end
    end

    if counter >=4
      return true
    end

    return false
  end

  def horizontal (row, column)
    piece = @current_board[row][column] #[4][2]
    counter = 1

    # counting in right direction

    3.times do |x|
      x += 1
      if !(@current_board[row][column + x]).nil?  && @current_board[row][column + x] == piece
      counter += 1
      else
      break
      end
    end

    #counting in left direction

    3.times do |x|
      x += 1
      if !(@current_board[row][column - x]).nil? && @current_board[row][column - x] == piece
      counter += 1
      else
      break
      end
    end

    if counter >=4
      return true
    end

    return false
  end

  def diagonal_right (row, column)
    piece = @current_board[row][column] #5,3 on paper
    counter = 1

    # counting up in right direction

    3.times do |x|
      x += 1
      if !(@current_board[row - x]).nil? && !(@current_board[row - x][column + x]).nil? && @current_board[row - x][column + x] == piece
      counter += 1
      else
      break
      end
    end

    #counting down in the left direction

    3.times do |x|
      x += 1
      if !(@current_board[row + x]).nil? && !(@current_board[row + x][column - x]).nil? && @current_board[row + x][column - x] == piece
      counter += 1
      else
      break
      end
    end

    if counter >=4
      return true
    end

    return false
  end

  def diagonal_left (row, column)
    piece = @current_board[row][column]
    counter = 1

    # counting up in left direction

    3.times do |x|
      x += 1
      if !(@current_board[row - x]).nil? && !(@current_board[row - x][column - x]).nil? && @current_board[row - x][column - x] == piece
      counter += 1
      else
      break
      end
    end

    #counting down in the right direction

    3.times do |x|
      x += 1
      if !(@current_board[row + x]).nil? && !(@current_board[row + x][column + x]).nil? && @current_board[row + x][column + x] == piece
      counter += 1
      else
      break
      end
    end

    if counter >=4
      return true
    end

    return false
  end

end


g = ConnectFour.new
g.play