# Your code here!
require "byebug"
class Game

  def initialize

    @board = Board.new

  end
  #initialize players and board

  #start game loop
  def start_game
    @board.build_board
    puts "Game started"
    player1 = Player.new(@board, :o)
    player2 = choose_opponent

    loop do
      player1.move
      @board.render #include move check and display
      puts "Other player move"
      player2.move
      @board.render
    end
  end

  def choose_opponent
    if play_against_AI?
      return AI.new(@board, :x)
    else
      return Player.new(@board, :x)
    end
  end

  def play_against_AI?
    input = false
    unless (input.class.is_a? Integer) && [1,2].include?(input)
      puts "Play against a (1)computer or (2) another player?"
      input = gets.chomp.to_i
    end
    input == 1 ? true : false
  end

end

class Player

  def initialize(board, piece)

    @board_array = board.field
    @board = board
    @piece = piece

  end

  def get_input
    puts "Which column do you want to put your piece in? (from column from 1 to 7)"
    input = gets.chomp.to_i
  end

  def move
    col=get_input

    until check?(col)
      col=get_input
    end
    row=find_row(col)

    @board_array[row][col-1] = @piece
    if @board.game_over?(@piece)
      @board.render
      exit
    end
  end

  def check?(col)
    arr = []
    5.downto(0) do |row|
      arr << @board_array[row][col-1]
    end
    empty_space = arr.include?("0")
    puts "This column is full!" unless empty_space
   (col < 8 && col > 0 &&  empty_space)
  end

  def find_row(col)
    row = 5
    while @board_array[row][col-1] != "0"
        if row < 0
          puts "Counted down 0"
          break
        else
         row -= 1
       end
    end
    row
  end

end

class AI < Player #untested

  def move
    #puts "AI move"
    @last_move = [5,0]
    #if no symbol, random
    #if symbol, put in adjacent spot,   =o=x==oox
      #only if more than 2 spaces available(your symbol or free)
    if vertical_check(symbol) || horizontal_check(symbol)
      @board_array[row][col-1] = @piece
      @last_move = [row, col]
    end
    #diagonal moves
    #block player
  end


  def vertical_check?(symbol, last_move)
    col = last_move[1]

    0.upto(2) do |row|
      if [@field[row][col],@field[row+1][col],@field[row+2][col],@field[row+3][col]].all?  {|place| place == symbol || place == "0"}
        return true
      end
    end

    false
  end


  def horizontal_check?(symbol, last_move)
    row = last_move[0]
    0.upto(3) do |index|
      if row[index..index+3].all? do |place|
        place == symbol || place == "0"
        return true
        end #end for .all? method
      end
    false
  end


  end

end

class Board
  attr_accessor :field
  #pass instance into game
  #check move in board
  #render
  def initialize
    @field =[]
  end

  def render
    for row in (0..5) #rows
      for column in (0..6) #columns
        print @field[row][column]
      end
      puts
    end
  end

  def build_board  #top right= row 0, col 0; bottom left= row 5, col6
    for row in (0..5) #rows
      @field<<[]
      for column in (0..6) #columns
        @field[row][column]="0"
        print @field[row][column]
      end
      puts
    end
    @field
  end

  def game_over?(symbol)
    winning_combo?(symbol) || tie?(symbol)
  end

  def winning_combo?(symbol)
    vertical_win?(symbol) || horizontal_win?(symbol) || diagonal_win?(symbol)
  end

  def tie?(symbol)
    for row in (0..5) #rows
      for column in (0..6) #columns
        return false if @field[row][column] == '0'
      end
    end
    puts "No more moves! It's a tie."
    true
  end

  def vertical_win?(symbol)

    0.upto(6) do |col|
      0.upto(2) do |row|
        if [@field[row][col],@field[row+1][col],@field[row+2][col],@field[row+3][col]].all?  {|place| place == symbol}

          return true
        end
      end
    end

    false
  end


  def horizontal_win?(symbol)
    @field.each do |row|
      0.upto(3) do |index|
        if row[index..index+3].all? {|place| place == symbol}
          return true
        end
      end
    end
    false
  end

  def diagonal_win?(symbol)
    #top right= row 0, col 0; bottom left= row 5, col6
    0.upto(3) do |col|
      5.downto(3) do |row|
        break if !(0..5).include?(row+3) || !(0..6).include?(col-3)
        if [@field[row][col],@field[row+1][col-1],@field[row+2][col-2],@field[row+3][col-3]].all?  {|place| place == symbol}
          return true
        end
      end
    end

    6.downto(3) do |col|
      5.downto(3) do |row|
        break if !(0..5).include?(row-3) || !(0..6).include?(col-3)
        if [@field[row][col],@field[row-1][col-1],@field[row-2][col-2],@field[row-3][col-3]].all?  {|place| place == symbol}
          return true
        end
      end
    end

    false
  end

end




g=Game.new
g.start_game