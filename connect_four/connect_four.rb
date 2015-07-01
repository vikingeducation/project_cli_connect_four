# Your code here!

class Game

  def initialize # set initial state
    @board = Board.new
    @board.build_board
    #start_game
  end
  #initialize players and board

  #start game loop
  def start_game
    puts "Game started"
    player1 = Player.new(@board)
    player2 = Player.new(@board)

    loop do
      player1.move
      player2.move
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
    @player_board = board
  end

  def get_input
    puts "Which column do you want to put your piece in? (from column from 1 to 7)"
    input = gets.chomp.to_i
  end

  def move
    @player_board.render #include move check and display
    move = get_input
    puts move
    @player_board[5][move] = "-"

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