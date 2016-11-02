require 'pry'

class ConnectFour
  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new(@board, 'O')
    @player2 = HumanPlayer.new(@board, 'X')
    @current_player = @player1
  end

  def play
    loop do 
      @board.display
      break if game_over?
      @current_player.make_move
      switch_players
    end
  end

  def game_over?
    @board.full? || @board.four_connected?
  end

  def switch_players
    if @current_player == @player1
      @current_player = @player2
    else
      @current_player = @player1
    end
  end

end

class Board
  attr_accessor :layout
  def initialize
    @layout = Array.new(7){Array.new(0)}
  end

  def display
    index_num = 7
    while index_num > -1 do 
      @layout.each do |list|
        print list[index_num]
      end
      print "\n"
      index_num -= 1
    end
    puts "1 2 3 4 5 6 7"
  end

  def full?
    @layout.all? { |column| column.length == 7 }
  end

  def four_connected?
    false
  end


  def add_piece(column, piece)
    # return false if invalid_column?(column)
    @layout[column-1] << piece
  end
end

class Player
  def initialize(board, piece)
    @board = board
    @piece = piece
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

game = ConnectFour.new
game.play

#choose size