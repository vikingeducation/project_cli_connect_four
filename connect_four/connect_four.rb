require 'pry'

class ConnectFour
  def initialize
    @board = Board.new
    @player1 = HumanPlayer.new(@board, 'O')
    @player2 = HumanPlayer.new(@board, 'X')
    @current_player = @player1
  end

  def play
    @board.setup
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
    @layout = Array.new(7){Array.new(6)}
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
    puts "1234567"
  end

  def full?
    @layout.all? { |column| column.length == 7 }
  end

  def four_connected?
    false
  end


  def add_piece(column, piece)
    # return false if invalid_column?(column)
    index = column -1
    column = layout[index]
    piece_index = find_piece_index(column)
    @layout[piece_index] = piece
  end

  def find_piece_index(column)
    index = 0
    column.each_with_index do |cell, cell_number|
      if cell != "_"
        index = cell_number - 1
      end
    end
    index
  end

  def setup
    new_layout = []
    @layout.each_with_index do |column, column_number|
      new_column = []
      column.each_with_index do |cell, cell_number|
        new_column[cell_number] = "_"
      end
      new_layout[column_number] = new_column
    end
    @layout = new_layout
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