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
    player2 = Player.new(@board, :x)

    loop do
      player1.move
      @board.render #include move check and display
      puts "Other player move"
      player2.move
      @board.render

    end
  end


  #render empty board
  #ask player for move
  #render board after each move
  #check for win state: horizontal, vertical, diagonal
end

class Player
  #pass instance into game
  #make a move
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
    puts "#{@board.game_over?(@piece)}"
    if @board.game_over?(@piece) 
      @board.render
      exit 
    else
      "Checked"
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
  # =>valid move?

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

  def build_board
    #build board
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
    # no winning combo and full board
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


  def horizontal_win?(symbol) #
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
    
  end

end
g=Game.new
g.start_game
