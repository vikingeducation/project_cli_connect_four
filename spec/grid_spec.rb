# spec/grid_spec.rb

require 'grid'
include ConnectFour

describe "Grid" do
  describe "#initialize" do
    let (:grid) { Grid.new }
    let (:game_grid) { grid.grid }

    it "creates a Hash to store markers in the grid" do
      expect(game_grid).to be_kind_of(Hash)
    end

    it "the created hash contains exactly 7 keys that are integers from 1 to 7" do
      # check that the hash has exactly 7 keys
      grid_keys = game_grid.keys.sort
      
      expect(grid_keys.size).to eq(7)

      # check if the hash's keys are actually just 1 to 7
      correct_grid_keys = true
      grid_keys.each.with_index do |key, index|
        correct_grid_keys = false unless key == index + 1
      end

      expect(correct_grid_keys).to be_truthy
    end

    it "the created hash contains exactly 7 empty arrays as values" do
      grid_values = game_grid.values

      expect(grid_values.size).to eq(7)
      expect(grid_values.all? { |value| value == [] } )
    end
  end

  describe "#valid_move?(column)" do
    it "accepts only a integer from 1 to 7 as a valid column input" do
      grid = Grid.new

      expect(grid.valid_move?(1)).to be_truthy
      expect(grid.valid_move?(2)).to be_truthy
      expect(grid.valid_move?(3)).to be_truthy
      expect(grid.valid_move?(4)).to be_truthy
      expect(grid.valid_move?(5)).to be_truthy
      expect(grid.valid_move?(6)).to be_truthy
      expect(grid.valid_move?(7)).to be_truthy

      expect(grid.valid_move?(0)).to be_falsey
      expect(grid.valid_move?(9)).to be_falsey
      expect(grid.valid_move?(-1.0)).to be_falsey
    end

    it "does not accept 1 to 7 as a valid column if the corresponding column is full" do
      full_column = { 1 => ["X", "X", "X", "X", "X", "X"],
                      2 => ["X", "X", "X", "X", "X"],
                      3 => [],
                      4 => [],
                      5 => [],
                      6 => [],
                      7 => []
                    }

      grid = Grid.new(full_column)

      expect(grid.valid_move?(1)).to be_falsey
      expect(grid.valid_move?(2)).to be_truthy
      expect(grid.valid_move?(3)).to be_truthy
    end
  end

  describe "#winning_move?(column)" do
  end

  describe "#full?" do
    it "returns true if all 42 spaces on the grid are correctly filled up" do
      full_grid = { 1 => ["X", "X", "X", "X", "X", "X"],
                    2 => ["X", "X", "X", "X", "X", "X"],
                    3 => ["X", "X", "X", "X", "X", "X"],
                    4 => ["X", "X", "X", "X", "X", "X"],
                    5 => ["X", "X", "X", "X", "X", "X"],
                    6 => ["X", "X", "X", "X", "X", "X"],
                    7 => ["X", "X", "X", "X", "X", "X"]
                  }

      expect(Grid.new(full_grid).full?).to be_truthy
    end

    it "returns false if the grid has more than 42 values" do
      invalid_grid = { 1 => ["X", "X", "X", "X", "X", "X"],
                       2 => ["X", "X", "X", "X", "X", "X"],
                       3 => ["X", "X", "X", "X", "X", "X"],
                       4 => ["X", "X", "X", "X", "X", "X"],
                       5 => ["X", "X", "X", "X", "X", "X"],
                       6 => ["X", "X", "X", "X", "X", "X"],
                       7 => ["X", "X", "X", "X", "X", "X", "X"]
                     } 

      expect(Grid.new(invalid_grid).full?).to be_falsey
    end

    it "returns false if the grid is imbalanced (more than 6 values in a column)" do
      # 42 total values, but there are 7 values in the first column
      imbalanced_grid = { 1 => ["X", "X", "X", "X", "X", "X", "X"],
                          2 => ["X", "X", "X", "X", "X", "X"],
                          3 => ["X", "X", "X", "X", "X", "X"],
                          4 => ["X", "X", "X", "X", "X", "X"],
                          5 => ["X", "X", "X", "X", "X", "X"],
                          6 => ["X", "X", "X", "X", "X", "X"],
                          7 => ["X", "X", "X", "X", "X"]
                        }

      expect(Grid.new(imbalanced_grid).full?).to be_falsey
    end

    it "returns false if the grid is empty" do
      expect(Grid.new.full?).to be_falsey
    end
  end

  describe "#place_marker(column, marker)" do
    let (:grid) { Grid.new }
    let (:game_grid) { grid.grid }

    it "places the specified marker in the correct column" do
      grid.place_marker(1, "A")
      grid.place_marker(2, "B")
      grid.place_marker(3, "C")
      grid.place_marker(4, "D")
      grid.place_marker(5, "E")
      grid.place_marker(6, "F")
      grid.place_marker(7, "G")

      expect(game_grid[1].last).to eq("A")
      expect(game_grid[2].last).to eq("B")
      expect(game_grid[3].last).to eq("C")
      expect(game_grid[4].last).to eq("D")
      expect(game_grid[5].last).to eq("E")
      expect(game_grid[6].last).to eq("F")
      expect(game_grid[7].last).to eq("G")

      grid.place_marker(1, "H")

      expect(game_grid[1].last).not_to eq("A")
      expect(game_grid[1].last).to eq("H")
    end

    it "returns the [col, row] position of the marker just placed" do
      last_pos = grid.place_marker(1, "A")
      col, row = last_pos[0], last_pos[1]

      expect(col).to eq(1)
      expect(row).to eq(0)

      last_pos = grid.place_marker(1, "B")
      col, row = last_pos[0], last_pos[1]

      expect(col).to eq(1)
      expect(row).to eq(1)

      last_pos = grid.place_marker(7, "C")
      col, row = last_pos[0], last_pos[1]

      expect(col).to eq(7)
      expect(row).to eq(0)
    end
  end
end