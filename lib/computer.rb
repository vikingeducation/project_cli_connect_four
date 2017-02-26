=begin
  Public interface:
    initialize
    choose_column

  Private methods:
    column_heights
    possible_moves(rows)
    column_of_winning_move(moves)

  Test paths:
    choose_column:
      - test that if there's a move that wins the game, the method returns that column
      - if there is no winning move, test that a value from 1 to 7 is returned (not sure we can actually test that it returns a random value within that range)
=end

module ConnectFour

  class Computer < Player
    def initialize(name, marker)
      super
    end

    def choose_column
      winning_column = find_winning_column

      winning_column.nil? ? (1..7).to_a.sample : winning_column
    end

    private

    # a "cheating" method to find a winning move -
    # the computer places a marker, checks if it wins the game,
    # undoes the move if it does, and returns the winning column
    def find_winning_column
      (1..7).each do |col|
        move = self.grid.place_marker(col, self.marker)
        if self.grid.winning_move?(move)
          self.grid.grid[col].pop
          return col
        end

        # undo move
        self.grid.grid[col].pop
      end

      nil
    end
  end

end