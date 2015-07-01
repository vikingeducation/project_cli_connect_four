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
    until move_valid?(col) 
      col=get_input 
    end
    @board[5][col-1] = "-"
  end

  # =>valid move?
  def move_valid?(col)
    #puts some kind of check
    if col < 8 && @board[5][col-1]=="0" 
      true
    else
      puts "You can't put it there"
      return false
    end  

    
  end

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
    for i in (0..5) #rows   
      for j in (0..6) #columns  
        print @field[i][j]
      end
      puts
    end
  end

  def build_board
    #build board
    for i in (0..5) #rows
      @field<<[]
      for j in (0..6) #columns
        @field[i][j]="0"
        print @field[i][j]
      end
      puts
    end
  end
end
g=Game.new
g.start_game
