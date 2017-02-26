# spec/computer_spec.rb

require 'player'
require 'computer'
require 'grid'
include ConnectFour

describe "Computer" do
  describe "#choose_column" do
    it "always chooses a vertical winning column if one is available" do
      game_grid = { 1 => [],
                    2 => ["X", "X", "X"],
                    3 => ["O"],
                    4 => ["O"],
                    5 => ["O"],
                    6 => [],
                    7 => []
                  }

      grid = Grid.new(game_grid)
      computer = Computer.new("Skynet", "X")
      computer.grid = grid
      winning_column = computer.choose_column

      expect(winning_column).to eq(2)
    end

    it "always chooses a horizontal winning column if one is available" do
      game_grid = { 1 => [],
                    2 => ["X", "X", "X"],
                    3 => ["O"],
                    4 => ["O"],
                    5 => ["O"],
                    6 => [],
                    7 => []
                  }

      grid = Grid.new(game_grid)
      computer = Computer.new("Skynet", "O")
      computer.grid = grid
      winning_column = computer.choose_column

      expect(winning_column).to eq(6)
    end

    it "always chooses a diagonal winning column if one is available" do
      game_grid = { 1 => ["X"],
                    2 => ["O", "X"],
                    3 => ["X", "O", "X"],
                    4 => ["O", "X", "O"],
                    5 => ["O"],
                    6 => [],
                    7 => []
                  }

      grid = Grid.new(game_grid)
      computer = Computer.new("Skynet", "X")
      computer.grid = grid
      winning_column = computer.choose_column

      expect(winning_column).to eq(4)

      game_grid = { 1 => ["X"],
                    2 => ["O", "X", "X"],
                    3 => ["X", "O", "O"],
                    4 => ["X", "O", "O"],
                    5 => ["O", "X"],
                    6 => [],
                    7 => []
                  }

      grid = Grid.new(game_grid)
      computer = Computer.new("Skynet", "O")
      computer.grid = grid
      winning_column = computer.choose_column

      expect(winning_column).to eq(2)
    end

    it "chooses a random column otherwise" do
      game_grid = { 1 => [],
                    2 => ["X", "X"],
                    3 => ["O"],
                    4 => ["O"],
                    5 => [],
                    6 => [],
                    7 => []
                  }

      grid = Grid.new(game_grid)
      computer = Computer.new("Skynet", "O")
      computer.grid = grid
      winning_column = computer.choose_column

      expect([1, 2, 3, 4, 5, 6, 7]).to include(winning_column)
    end
  end
end