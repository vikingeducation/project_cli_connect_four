require_relative 'board.rb'
require 'byebug'

class Player

  attr_reader :color

  def initialize(color)
    @color = color
  end

  def add_piece(column, board)
    # byebug
    #add piece to the board
    unless board.column_full?(column)
      6.downto(1).to_a.each do |row|
        if board.position_empty?(board.board[row][column - 1])
          board.board[row][column - 1] = @color
          return true
        end
      end
    else
      puts "Column full"
      return false
    end   
  end



end