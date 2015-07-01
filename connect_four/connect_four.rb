# Your code here!

class Game
  
  def initialize
    

    start_game
  end
  #initialize players and board

  #start game loop
  def start_game
    @board = Board.new.build_board
    puts "Game started"
    player1 = Player.new 
    player2 = Player.new
    
    loop do
      player1.move(@board)
      @board.render #include move check and display
      player2.move(@board)
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
  def initialize
    @board
  end

  def get_input
    puts "Which column do you want to put your piece in? (from column from 1 to 7)"
    input = gets.chomp.to_i
  end

  def move(board_current)
    move=get_input
    puts move
    board_current[5][move] = "-"
    
  end
  # =>valid move?
  def move_valid?
    #puts some kind of check
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