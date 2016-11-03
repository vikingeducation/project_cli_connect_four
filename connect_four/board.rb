require 'pry'
require 'pry-byebug'

class Board

  def initialize

    @grid = [
              [' ',' ',' ',' ',' ',' ',' '],
              [' ',' ',' ',' ',' ',' ',' '],
              [' ',' ',' ',' ',' ',' ',' '],
              [' ',' ',' ',' ',' ',' ',' '],
              [' ',' ',' ',' ',' ',' ',' '],
              [' ',' ',' ',' ',' ',' ',' ']
            ]

    # @grid = [
    #           ['O','O','O',' ','O','O','O'],
    #           ['O','O','O','O','O','O','O'],
    #           ['O','O','X','O','O','X','X'],
    #           ['O','O','O','X','O','O','X'],
    #           ['O','O','O','X','X','X','O'],
    #           ['X','O','O','X','O','X','X']
    #         ]
    # @grid = [
    #           [' ',' ','O',' ',' ',' ',' '],
    #           [' ',' ','O',' ',' ',' ',' '],
    #           [' ',' ','X','O','O','X','X'],
    #           [' ',' ','O','X','O','O','X'],
    #           [' ',' ','O','X','X','X','O'],
    #           ['X','O','O','X','O','X','X']
    #         ]

    # @grid = [[],[],[],[],[],[],[]]
  end

  def render
    puts
    label = "-0-1-2-3-4-5-6-"
    puts label
    @grid.each do |row|
      puts "|#{row.join('|')}|"
    end
    puts label
    puts
  end

  def column(column_index)
    columns = @grid.transpose
    columns[column_index]
  end

  def column_full?(column_index)
    ['X','O'].include?(column(column_index)[0])
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

  def four_in_a_row?(array, piece_type)
    string = array.join('')
    pattern = piece_type * 4
    string.include?(pattern)
  end

  def detected_win?(piece_type)
    vertical_win?(piece_type) || horizontal_win?(piece_type) || diagonal_right_win?(piece_type) || diagonal_left_win?(piece_type)
  end

  def vertical_win?(piece_type)
    @grid.transpose.any? { |column| four_in_a_row?(column, piece_type) }
  end

  def horizontal_win?(piece_type)
    @grid.any? { |row| four_in_a_row?(row, piece_type) }
  end

  def diagonal_right_win?(piece_type)
    # starting from 1st array, 1st item, iterate
    # by adding 1 to array and 1 to item and 
    # check if the next three are of the same type
    @grid.each_with_index do |row, row_index|
      row.each do |cell, cell_index|
        if four_diagonal_rights?(row_index, cell_index, piece_type)
          true
        else
          false
        end
      end
    end
  end

  def four_diagonal_rights?(row, cell, piece_type)
    four_adjacent_pieces = []
    binding.pry
    4.times do |i|
      four_adjacent_pieces << @grid[row][cell]
      row += 1
      cell += 1
    end
    adjacent_checker = four_adjecent_pieces.all? do |piece|
      piece == piece_type
    end
    if adjacent_checker
      return true
    else
      return false
    end
  end

  def diagonal_left_win?(piece_type)
  end

  def board_full?
    @grid.all? do |row|
      row.none? do |cell|
        cell == ' '
      end
    end
  end

end
