# spec/player_spec.rb
require 'player'
require 'grid'
include ConnectFour

describe "Player" do
  describe "#initialize" do
    it "saves passed-in values as instance variables" do
      name = "Bob"
      marker = "X"
      player = Player.new(name, marker)

      expect(player.name).to eq(name)
      expect(player.marker).to eq(marker)
    end

    it "sets the @grid instance variable to nil" do
      player = Player.new("Alice", "O")

      expect(player.grid).to be_nil
    end

    it "raises an ArgumentError if the number of arguments are wrong" do
      expect { Player.new }.to raise_error(ArgumentError)
      expect { Player.new("Alice") }.to raise_error(ArgumentError)
    end
  end

  describe "#name" do
    it "returns the correct value of the @name instance variable" do
      player = Player.new("Charlie Brown", "?")

      expect(player.name).to eq("Charlie Brown")
    end
  end

  describe "#marker" do
    it "returns the correct value of the @marker instance variable" do
      player = Player.new("Snoopy", "O")

      expect(player.marker).to eq("O")
    end
  end

  describe "#grid" do
    it "returns the correct value of the @grid instance variable" do
      player = Player.new("Linus", "X")

      expect(player.grid).to be_nil

      test_grid = Grid.new
      player.grid = test_grid

      expect(player.grid).to eq(test_grid)
    end
  end

  describe "#grid=" do
    it "sets the @grid instance variable correctly" do
      game_grid = { 1 => ["X"],
                    2 => [],
                    3 => [],
                    4 => [],
                    5 => [],
                    6 => [],
                    7 => []
                  }

      grid = Grid.new(game_grid)
      player = Player.new("Bob", "X")
      player.grid = grid

      expect(player.grid.grid[1].size).to eq(1)
      expect(player.grid.grid[1].last).to eq("X")
    end
  end
end