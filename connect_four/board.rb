require 'pry'
require 'pry-byebug'

class Board

  def initialize
    @grid = [
              ['O','O','O',' ','O','O','O'],
              ['O','O','O','O','O','O','O'],
              ['O','O','X','O','O','X','X'],
              ['O','O','O','X','O','O','X'],
              ['O','O','O','X','X','X','O'],
              ['X','O','O','X','O','X','X']
            ]
    @grid = [
              [' ',' ','O',' ',' ',' ',' '],
              [' ',' ','O',' ',' ',' ',' '],
              [' ',' ','X','O','O','X','X'],
              [' ',' ','O','X','O','O','X'],
              [' ',' ','O','X','X','X','O'],
              ['X','O','O','X','O','X','X']
            ]

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

  def detected_win(piece_type)
  end

  def vertical_win?(piece_type)
    @grid.transpose.any? { |column| four_in_a_row?(column, piece_type) }
  end

  def horizontal_win?(piece_type)
    @grid.any? { |row| four_in_a_row?(row, piece_type) }
  end

  def generate_diagonals(rect_array)
    results = []
    (0..rect_array.length).each do |i|
      diag = []
      (0..i).each do |j|
        (0..i).each do |k|
          diag.push([j,k]) if j + k == i
        end
      end
      results.push(diag)
    end
    results
  end

  def diagonal_win?(piece_type)
  end

  def board_full?
    @grid.all? do |row|
      row.none? do |cell|
        cell == ' '
      end
    end
  end

end
