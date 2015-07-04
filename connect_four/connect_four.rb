class Game

  def initialize
    @board = Board.new
  end

  def start_game
    @board.build_board
    puts "Game started"
    player1 = Player.new(@board, :o)
    player2 = choose_opponent

    loop do
      player1.move
      @board.render
      puts "Other player's move:"
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
    until ((input.is_a? Integer) && [1,2].include?(input))
      puts "Play against a (1)computer or (2) another player?"
      input = gets.chomp.to_i
    end
    input == 1 ? true : false
  end

end

class Player

  def initialize(board, piece)

    @board_array = board.field
    @board = board   #board object
    @piece = piece

  end

  def move
    row, col = define_column_row
    make_move(row, col)
    win
  end

  def make_move(row, col)
    @board_array[row][col-1] = @piece
  end

  private

  def win
    if @board.game_over?(@piece)
      @board.render
      puts "You Won!"
      exit
    end
  end

  def define_column_row
    col=get_input

    until check?(col)
      col=get_input
    end
    row=find_row(col)

    return row, col
  end

  def get_input
    puts "Which column do you want to put your piece in? (from column from 1 to 7)"
    gets.chomp.to_i
  end

  def check?(col)
    arr = []
    5.downto(0) do |row|
      arr << @board_array[row][col-1]
    end
    empty_space = arr.include?("-")
    puts "This column is full!" unless empty_space
   (col < 8 && col > 0 &&  empty_space)
  end

  def find_row(col)
    row = 5
    while @board_array[row][col-1] != "-"
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

    #if no symbol, random
    #if symbol, put in adjacent spot,   =o=x==oox
      #only if more than 2 spaces available(your symbol or free)
      #diagonal moves
    #block player
  def move #incomplete
    symbol = :x
    puts "The AI is still learning... it'll pass."
    @last_move = [5,0]

    # if vertical_check(symbol, @last_move) || horizontal_check(symbol, @last_move)
    #   @board_array[row][col-1] = symbol
    #   @last_move = [row, col]
    # end

  end


  def vertical_check(symbol)
    col = last_move[1]

    0.upto(2) do |row|
      if [@field[row][col],@field[row+1][col],@field[row+2][col],@field[row+3][col]].all?  {|place| place == symbol || place == "-"}
        return true
      end
    end

    false
  end


  def horizontal_check(symbol)
    row = last_move[0]
    0.upto(3) do |index|
      if row[index..index+3].all? do |place|
        place == symbol || place == "-"
        return true
        end #end for .all? method
      end
    false
  end


  end

end

class Board
  attr_accessor :field

  def initialize
    @field =[]
  end

  def render
    for row in (0..5) #rows
      for column in (0..6) #columns
        print @field[row][column]
        print " "
      end
      puts
    end
    puts "1|2|3|4|5|6|7"
  end

  def build_board  #top right= row 0, col 0; bottom left= row 5, col6
    for row in (0..5)
      @field<<[]
      for column in (0..6)
        @field[row][column]="-"
        print @field[row][column]
        print " "
      end
      puts
    end
    puts "1|2|3|4|5|6|7"
    @field
  end

  def game_over?(symbol)
    winning_combo?(symbol) || tie?
  end

  private

  def winning_combo?(symbol)
    vertical_win?(symbol) || horizontal_win?(symbol) || diagonal_left_win?(symbol) || diagonal_right_win?(symbol)
  end

  def tie?
    for row in (0..5) #rows
      for column in (0..6) #columns
        return false if @field[row][column] == "-"
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

  def diagonal_left_win?(symbol)

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

  def diagonal_right_win?(symbol)
    #top right= row 0, col 0; bottom left= row 5, col6
    0.upto(3) do |col|
      5.downto(3) do |row|
        break if !(0..5).include?(row-3) || !(0..6).include?(col+3)
        if [@field[row][col],@field[row-1][col+1],@field[row-2][col+2],@field[row-3][col+3]].all?  {|place| place == symbol}
          return true
        end
      end
    end

    false
  end

end

