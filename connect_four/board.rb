require 'pry'

class Board
  attr_reader :columns

  def initialize
    make_board
  end

  def make_board
    @columns = {}
    1.upto(7) do |i|
      @columns[i] = []
    end
    @columns 
  end

  def valid_move?(column)
    if @columns[column].length < 6
      true
    end 
  end

  def add_piece(column, piece)
    if valid_move?(column)
      @columns[column] << piece
    end    
  end

  def render_board
    @columns    
  end

  def winning_line?(piece)
    # diag || horiz || vert
    winning_horizontal?(piece)
  end

  def winning_diagonal?
    # check to see if player has a winning diagonal
  end

  def winning_horizontal?(piece)
    @columns.each do |col_number, column|
      column.each_with_index do |blank, position|
        if col_number == 5
          return false
        elsif blank == piece &&
          @columns[(col_number + 1)][position] == piece &&
          @columns[(col_number + 2)][position] == piece &&
          @columns[(col_number + 3)][position] == piece
          return true
        end
      end
    end
  end

  def winning_vertical?
    # check to see if player has a winning vertical
  end
  
  
end