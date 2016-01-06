require_relative 'board.rb'

class Player

  def initialize
    @color_piece = nil
    @board = Board.new # for testing purposes
  end

  def add_piece(column)
    #add piece to the board
    unless column_full?(column)
      6.downto(1).to_a.each do |row|
        if position_empty(@board[row][column])
          @board[row][column] = @color_piece
          break
        end
      end
    end   
  end



end