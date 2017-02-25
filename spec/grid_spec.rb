# spec/grid_spec.rb

require 'grid'
include ConnectFour

describe "Grid" do
  describe "#initialize" do
    let (:grid) { Grid.new }
    let (:game_grid) { grid.instance_variable_get(:@grid) }

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
                      2 => [],
                      3 => [],
                      4 => [],
                      5 => [],
                      6 => [],
                      7 => []
                    }

      grid = Grid.new(full_column)

      expect(grid.valid_move?(1)).to be_falsey
      expect(grid.valid_move?(2)).to be_truthy
    end
  end

  describe "#winning_move?(column)" do
  end

  describe "#full?" do
  end

  describe "#place_marker(column, marker)" do
  end
end