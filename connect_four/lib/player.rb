require_relative 'board.rb'
require 'byebug'

class Player

  attr_reader :color
  attr_accessor :column, :row

  def initialize(color)
    @color = color
    @column = 1
    @row = 1
  end

  def add_piece(column, board)
    if board.column_full?(column)
      return false
    else
      6.downto(1).to_a.each do |row|
        if board.position_empty?(board.board[row][column - 1])
          board.board[row][column - 1] = @color
          @row = row
          return true
        end
      end
    end   
  end
end