require 'pry'
require 'pry-byebug'

class Board

  def initialize
    @grid = [
              [' ',' ',' ',' ',' ',' ',' '],
              [' ',' ',' ',' ',' ',' ',' '],
              [' ',' ','X','O','O','X','X'],
              [' ',' ','O','X','O','O','X'],
              [' ',' ','O','X','X','X','O'],
              ['X','O','O','X','O','X','X']
            ]

    # @grid = [[],[],[],[],[],[],[]]
  end

  def render
    label = "-0-1-2-3-4-5-6-"
    puts label
    @grid.each do |row|
      puts "|#{row.join('|')}|"
    end
    puts label
  end

  def column
  end

  def move_valid?
  end

  def column_full?
  end

  def valid_column?
  end

  def place(piece_type, column_index)
    # add pieces to board
    #until move_valid?
      # adding a move to the board
      piece_added = false
      (@grid.length-1).downto(0) do |row_index|
        #binding.pry
        break if piece_added == true
        if @grid[row_index][column_index] == ' '
          @grid[row_index][column_index] = piece_type
          piece_added = true
        end
      end
    #end
  end

  def four_in_a_row?
    # return 'X' or 'O' or nil
  end

  def vertical_win?(piece_type)
  end

  def horizontal_win?(piece_type)
  end

  def diagonal_win?(piece_type)
  end

  def board_full?
  end

end
