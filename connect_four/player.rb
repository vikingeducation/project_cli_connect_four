require_relative 'board.rb'
require 'byebug'

class Player

  attr_reader :color_piece

  def initialize
    @color_piece = "B"
  end

  def add_piece(column, board)
    byebug
    #add piece to the board
    unless board.column_full?(column)
      6.downto(1).to_a.each do |row|
        if board.position_empty?(board[row][column - 1])
          board[row][column - 1] = @color_piece
          break
        end
      end
    end   
  end



end