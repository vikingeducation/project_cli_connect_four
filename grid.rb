module ConnectFour
  
  class Grid
    attr_accessor :grid

    # create grid with 7 columns upon object instantation
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

      # check marker of last move
      last_marker = grid[col][row]

      return true if grid[col].count { |marker| marker == last_marker } == 4

      false
    end

    def diagonal_win?(move)

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

include ConnectFour

g = Grid.new
# p g.place_marker(1, "R")
# p g.place_marker(2, "Y")
# p g.place_marker(1, "R")
# p g.place_marker(1, "R")
# move = g.place_marker(1, "R")
# p move
# p g.vertical_win?(move)

g.place_marker(1, "R")
g.place_marker(2, "R")
g.place_marker(3, "R")
move = g.place_marker(4, "R")
p g.horizontal_win?(move)
puts g.render