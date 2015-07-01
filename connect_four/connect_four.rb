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
    player1 = Player.new(@board)
    player2 = Player.new(@board)

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
  def initialize(board)

    @board=board.field

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

    @board[row][col-1] = "-"
  end

  def check?(col)
      arr = []
      5.downto(0) do |row|
        arr << @board[row][col]
      end
      
     (col < 8 && col > 0 &&  arr.include?("0")) 
  end

  def find_row(col)
    row = 5
    while @board[row][col-1] != "0"  
        row<0 ? (puts "Counted down 0") : row -= 1
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
    @field=[]
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
end
g=Game.new
g.start_game
