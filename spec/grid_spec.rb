# spec/grid_spec.rb

require 'grid'

describe "Grid" do
  let (:grid) { ConnectFour::Grid.new }

  describe "#initialize" do
    it "creates a Hash to store markers in the grid" do
      expect(grid.instance_variable_get(:@grid)).to be_kind_of(Hash)
    end
  end

  describe "#valid_move?(column)" do
  end

  describe "#winning_move?(column)" do
  end

  describe "#full?" do
  end

  describe "#place_marker(column, marker)" do
  end
end