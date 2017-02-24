=begin
  Public interface:
    initialize
    valid_move?(column)
    winning_move?(move)
    full?
    render
    place_marker(column, marker)

  Private methods:
    horizontal_win?(move)
    vertical_win?(move)
    diagonal_win?(move)
    count_markers(move, col_offset, row_offset)
    valid_index?(col, row)

  Test paths:
    initialize
      - Test that grid is a dictionary with 7 keys mapping to 7 empty arrays

    valid_move?(column)
      - Value between 1 to 7 returns true
      - Any other value returns false
      - Test it with other types, e.g. floats and strings

    winning_move?(move)
      - Setup grid by manually configuring the arrays
      - A move that makes 4 in a row horizontally returns true
        - Test multiple rows
        - Test multiple possible combinations in the same row
      - A move that makes 4 in a row vertically returns true
        - Test multiple columns
        - Test multiple possible combinations in the same column
      - A move that makes 4 in a row diagonally returns true
        - Test both diagonals
        - Test multiple diagonals across the grid
      - Any other move returns false

    full?
      - Return true only if the grid is full
      - Return false otherwise

    place_marker(column, marker)
      - Test that marker placed in column is correct
      - Test that method returns the move's [col, row]
      - Test invalid inputs for column

=end

module ConnectFour
  
  class Grid
    attr_reader :grid

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
      grid[column].size < 6 && (1..7).include?(column)
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

    # checks if the grid is full, i.e. all 42 spaces are filled up
    def full?
      grid.values.all? { |column| column.size == 6 }
    end

    # renders the grid
    def render
      output = []

      0.upto(5) do |row|
        string = ""
        1.upto(7) do |col|
          string += grid[col][row].nil? ? ".".center(3) : "#{grid[col][row].center(3)}"
        end
        output.push(string)
      end

      output.map! { |string| string.center(32) }
      output.map! { |string| string += "\n" }
      output.reverse!
      
      # add column listing to output
      column_listing = ""
      1.upto(7) { |col| column_listing += col.to_s.center(3) }
      output.push(column_listing.center(32))

      puts output.join
      puts
    end

    private

    # checks if there are 4 in a row horizontally in the rows of the last move
    def horizontal_win?(move)
      # count markers to the left of the move
      markers_to_left = count_markers(move, -1, 0)

      # count markers to the right of the move
      markers_to_right = count_markers(move, 1, 0)

      # subtract one as the marker in the move is counted twice
      total = markers_to_left + markers_to_right - 1

      total >= 4 ? true : false
    end

    # checks if there are 4 in a row vertically in the column of the last move
    def vertical_win?(move)
      markers_to_bottom = count_markers(move, 0, -1)

      markers_to_bottom == 4 ? true : false
    end

    # checks if there are 4 in a row in either of these two diagonals, 
    # that includes the last move:
    # 1. top left to bottom right
    # 2. top right to bottom left 
    def diagonal_win?(move)
      markers_to_top_left = count_markers(move, -1, 1)
      markers_to_top_right = count_markers(move, 1, 1)
      markers_to_bottom_left = count_markers(move, -1, -1)
      markers_to_bottom_right = count_markers(move, 1, -1)

      top_left_bottom_right_markers = markers_to_top_left + markers_to_bottom_right - 1

      top_right_bottom_left_markers = markers_to_top_right + markers_to_bottom_left - 1 

      top_left_bottom_right_markers == 4 || top_right_bottom_left_markers == 4 ? true : false
    end

    # count markers in a row that are identical as that 
    # of the last move, in a direction represented by 
    # a grid offset
    def count_markers(move, col_offset, row_offset)
      col, row = move[0], move[1]
      marker_in_move = grid[col][row]
      count = 0

      while valid_index?(col, row)
        # break if we find a marker that's identical
        # to the one in the move
        grid[col][row] == marker_in_move ? count += 1 : break
        
        col += col_offset
        row += row_offset
      end

      count
    end

    # checks if the provided column/row indices are valid
    def valid_index?(col, row)
      (1..7).include?(col) && (0..5).include?(row)
    end
  end

end
