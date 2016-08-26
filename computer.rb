require_relative 'player.rb'

class Computer < Player

  def initialize(name, piece, board)
    @name = Computer
    @piece = piece
    @board = board
  end

  def get_column
    loop do
      column = rand(7)
      if valid_move?(column)
        break if @board.add_piece(column, @piece)
      end
    end
  end

end