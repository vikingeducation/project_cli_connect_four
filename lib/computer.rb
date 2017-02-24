module ConnectFour

  class Computer < Player
    def initialize(name, marker)
      super
    end

    def choose_column
      rows = column_heights
      moves = possible_moves(rows)
      winning_column = column_of_winning_move(moves)

      winning_column.nil? ? (1..7).to_a.sample : winning_column
    end

    private

    # get the heights of all columns to determine the row portion
    # of the grid coordinates
    def column_heights
      unless self.grid.nil?
        heights = []
        self.grid.grid.each do |key, value|
          heights[key - 1] = value.size
        end

        heights
      end
    end

    # based on the current height of each column,
    # build out the set of next possible moves
    def possible_moves(rows)
      unless rows.nil?
        moves = []
        col = 1
        rows.each do |row|
          moves.push([col, row])
          col += 1
        end

        moves
      end
    end

    # check if any of the next possible moves win the game
    # if so, return the column of the move so that we know
    # where to place the marker
    def column_of_winning_move(moves)
      moves.each { |move| return move[0] if self.grid.winning_move?(move) } unless moves.nil?

      nil
    end
  end

end