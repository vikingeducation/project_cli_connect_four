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

    # checks if the column a player wants to place a disc in is valid
    def valid_move?(column)
      grid[column].size <= 6
    end

    # "drops" a disc into the specified column
    def place_disc(column, disc)
      grid[column].push(disc)
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
g.place_disc(1, "R")
g.place_disc(2, "Y")
g.place_disc(1, "R")
puts g.render