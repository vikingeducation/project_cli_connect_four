##current board is not being sent in line 22,35 because it's only used in board.... see if AI works with board instead

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
      @current_board = @game.current_board
      until player1_valid 
        puts "Player Red Turn"
        player1_move = @player1.turn(@current_board)
        player1_valid =  @game.make_move(player1_move, @player1_color) 
       end

      @game.render
      if @game.win?
        puts "Player Red wins"
        exit
      end
  
      player2_valid = false
      until player2_valid
        puts "Player Black Turn"
        player2_move = @player2.turn(@current_board)
        player2_valid = @game.make_move(player2_move, @player2_color)
      end

      @game.render
      if @game.win?
        puts "Player Black wins"
        exit
      end

    end

  end

  def choose_opponent

    valid_options = ["h", "c","a"]
    opponent = ""

    until valid_options.include?(opponent)
    puts "Would you like to play vs human(h), computer(c) or AI(a)? "
    opponent = gets.chomp.downcase
    end
    
    if opponent == "h"
      @player2 = Human.new
    elsif opponent == "c"
      @player2 = Computer.new
    elsif opponent == "a"
      @player2 = AI.new
    end

  end

end

class Human

  def turn(current_board) #useless

    puts "Where do you want to drop your piece (column from right)"
    gets.chomp.to_i-1

  end

end

class Computer

  def turn(current_board) #useless
    (0..6).to_a.sample
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
    # CHECK WORKING
    # p "Vertical " + vertical(@row, @column).to_s
    # p "horizontal " + horizontal(@row, @column).to_s
    # p "diagonal_right " + diagonal_right(@row, @column).to_s
    # p "diagonal_left " + diagonal_left(@row, @column).to_s

    [vertical(@row, @column), horizontal(@row, @column), diagonal_right(@row, @column), diagonal_left(@row, @column)].any?

  end

  ###### Methods to check if 4 pieces in a row ########

  def vertical (row, column)
    piece = @current_board[row][column]
    counter = 1

    #counting in down on the board

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

    # counting up in right up direction

    3.times do |x|
      x += 1
      if !(@current_board[row - x]).nil? && !(@current_board[row - x][column + x]).nil? && @current_board[row - x][column + x] == piece
      counter += 1
      else
      break
      end
    end

    #counting down in the left down direction

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

    # counting up in left up direction

    3.times do |x|
      x += 1
      if !(@current_board[row - x]).nil? && !(@current_board[row - x][column - x]).nil? && @current_board[row - x][column - x] == piece
      counter += 1
      else
      break
      end
    end

    #counting down in the right down direction

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




#### AI #####

class AI

  def initialize
    @opponent_color = "R"
    
  end

  def turn(current_board) 
    @current_board = current_board
    pieces = []

    7.times do |column|
      bottom_row = bottom?(column)
      if bottom_row == false
        pieces << 0
      else
        pieces << check_pieces_around(bottom_row, column)
      end
    end

    #pieces [2, 3, 0, 1, 1, 0, 0]
    return pieces.index(pieces.max)

  end

  def bottom?(column)
    puts column

    5.downto(0) do |row|
      puts row
      puts @current_board[row][column]
      if @current_board[row][column] == "-"
        return row
      end
    end

    return false

  end
  
  def check_pieces_around(row,column)

      [vertical_check(row,column),horizontal_check(row,column),diagonal_right_check(row,column),diagonal_left_check(row,column)].max
     
  end

  def vertical_check(row, column)

    counter = 0

    #counting in down 
    3.times do |x|
       x += 1
      if !(@current_board[row + x]).nil?  && @current_board[row + x][column] == @opponent_color

      counter += 1
      else
      break
      end
    end
    
    return counter

  end

  def horizontal_check(row, column)

     counter = 0

    #counting right
    3.times do |x|
      x += 1
      if !(@current_board[row][column + x]).nil?  && @current_board[row][column + x] == @opponent_color

      counter += 1
      else
      break
      end
    end

    #counting left
    3.times do |x|
      x += 1
      if !(@current_board[row][column - x]).nil? && @current_board[row][column - x] == @opponent_color

      counter += 1
      else
      break
      end
    end
    
    return counter 

  end

    def diagonal_right_check(row, column)

     counter = 0
    

    3.times do |x|
      x += 1
      if !(@current_board[row - x]).nil? && !(@current_board[row - x][column + x]).nil? && @current_board[row - x][column + x] == @opponent_color

      counter += 1
      else
      break
      end
    end


    3.times do |x|
      x += 1
      if !(@current_board[row + x]).nil? && !(@current_board[row + x][column - x]).nil? && @current_board[row + x][column - x] == @opponent_color

      counter += 1
      else
      break
      end
    end
    
    return counter 

  end
  
  def diagonal_left_check(row, column)

     counter = 0

    3.times do |x|
      x += 1
      if !(@current_board[row - x]).nil? && !(@current_board[row - x][column - x]).nil? && @current_board[row - x][column - x] == @opponent_color

      counter += 1
      else
      break
      end
    end


    3.times do |x|
      x += 1
      if !(@current_board[row + x]).nil? && !(@current_board[row + x][column + x]).nil? && @current_board[row + x][column + x] == @opponent_color

      counter += 1
      else
      break
      end
    end
    
    return counter 

  end

end
  

g = ConnectFour.new
g.play