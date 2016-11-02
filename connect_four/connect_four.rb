class ConnectFour
  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new(@board)
    @player2 = BotPlayer.new(@board)
  end

  def play
    loop do 
      @board.display
      current_player.make_move
      switch.players
      break if game_over?
    end
  end

  def game_over?
  end

  def current_player
  end

end

class Board
  def initialize
    @layout = Array.new(6){Array.new(7)}
  end

  def display
  end

  def update_board()
  end

  def add_piece(column, piece)
    return false if invalid_column?(column)
    @layout[column-1] << piece
  end
end

class Player
  def initialize(board)
    @board = board
  end

  def make_move
    column = choose_column
    @board.add_piece(column, @piece)
  end

end

class HumanPlayer < Player
  def choose_column
    puts "pick column 1 to 7"
    input = gets.chomp.to_i
    #still needs validation
  end 
end

class BotPlayer < Player
  def choose_column
    (rand(7) + 1)
  end 
end

class Piece

end


#choose size