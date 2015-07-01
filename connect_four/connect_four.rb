# Your code here!

class Game

  def initialize
    @board = Board.new
    start_game
  end
  #initialize players and board

  #start game loop
  def start_game
    player1 = Player.new
    player2 = Player.new
    @board.render
    loop do
      player1.move
      @board.render #include move check and display
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
  def get_input
    puts "Which column do you want to put your piece in?"
    input = gets.chomp
  end

  def move
    get_input
  end
  # =>valid move?
  def move_valid?
    #puts some kind of check
  end

end

class Board
  #pass instance into game
  #check move in board
  #render
  def initialize

  end

  def render

  end

  def build_board
    #build board
  end


end