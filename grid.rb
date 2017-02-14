module ConnectFour
  
  class Grid
    attr_accessor :grid

    # create grid with 7 columns upon object instantation
    # each new item in the array is part of a new row
    def initialize
      @grid = {
        1 => [],
        2 => [],
        3 => [],
        4 => [],
        5 => [],
        6 => [],
        7 => []
      }
    end

    # checks if the column a player wants to place a marker in is valid
    def valid_move?(column)
      grid[column].size <= 6
    end

    # "drops" a marker into the specified column
    def place_marker(column, marker)
      grid[column].push(marker)

      # returns the col/row to determine if move wins game
      [column, grid[column].size - 1]
    end

    # determines if the move wins the game
    def winning_move?(move)
      horizontal_win?(move) || vertical_win?(move) || diagonal_win?(move)
    end

    # checks if there are 4 in a row horizontally in the rows of the last move
    def horizontal_win?(move)
      col, row = move[0], move[1]
      last_marker = grid[col][row]

      count = 0
      1.upto(7) { |column| count += 1 if grid[column][row] == last_marker }

      count == 4 ? true : false
    end

    # checks if there are 4 in a row vertically in the column of the last move
    def vertical_win?(move)
      col, row = move[0], move[1]
      last_marker = grid[col][row]

      return true if grid[col].count { |marker| marker == last_marker } == 4

      false
    end

    # count markers that are the same as the marker in the last move,
    # in a specified direction represented by an offset
    def count_markers(move, col_offset, row_offset)
      col, row = move[0], move[1]
      marker_in_move = grid[col][row]
      count = 0

      while valid_index?(col, row)
        count += 1 if grid[col][row] == marker_in_move
        col += col_offset
        row += row_offset
      end

      count
    end

    # checks if the provided column/row indices are valid
    def valid_index?(col, row)
      (1..7).include?(col) && (0..5).include?(row)
    end

    # renders the grid
    def render
      output = []

      0.upto(5) do |row|
        string = "Row #{row + 1}:  "
        1.upto(7) do |col|
          string += grid[col][row].nil? ? "." : grid[col][row]
        end
        output.push(string)
      end

      output.map! { |string| string.center(24) }
      output.map! { |string| string += "\n" }
      output.reverse!
    end
  end
end
