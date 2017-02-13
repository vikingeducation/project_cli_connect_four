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

      # returns the row/col to determine if move wins game
      [grid[column].size - 1, column]
    end

    # determines if the move wins the game
    def winning_move?(move)
      horizontal_win?(move) || vertical_win?(move) || diagonal_win?(move)
    end

    def valid_position?(move)
      # rows are within index 0 to 5
      # cols are within index 1 to 7
      row, col = move[0], move[1]

      (0..5).include?(row) && (1..7).include(col)
    end

    def horizontal_win?(move)

    end

    def vertical_win?(move)
    
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
p g.place_disc(1, "R")
p g.place_disc(2, "Y")
p g.place_disc(1, "R")
p g.place_disc(1, "R")
p g.place_disc(1, "R")
puts g.render