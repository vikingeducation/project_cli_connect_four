# spec/game_spec.rb

require 'grid'
require 'player'
require 'human'
require 'computer'
require 'game'
include ConnectFour

describe "Game" do
  let (:game) { Game.new }

  describe "#initialize" do
    it "instantiates the Grid object" do
      expect(game.grid).to be_a(Grid)
    end

    it "sets all other instance variables to nil" do
      expect(game.player_one).to be_nil
      expect(game.player_two).to be_nil
      expect(game.current_player).to be_nil
    end
  end

  describe "draw?" do
    it "returns true if the game grid's 42 squares are all filled" do
      full_grid = { 1 => ["X", "X", "X", "X", "X", "X"],
                    2 => ["X", "X", "X", "X", "X", "X"],
                    3 => ["X", "X", "X", "X", "X", "X"],
                    4 => ["X", "X", "X", "X", "X", "X"],
                    5 => ["X", "X", "X", "X", "X", "X"],
                    6 => ["X", "X", "X", "X", "X", "X"],
                    7 => ["X", "X", "X", "X", "X", "X"]
                  }

      expect(Game.new(full_grid).draw?).to be_truthy
    end

    it "returns false if not all the game grid's 42 squares are filled" do
      almost_full_grid = { 1 => ["X", "X", "X", "X", "X", "X"],
                           2 => ["X", "X", "X", "X", "X", "X"],
                           3 => ["X", "X", "X", "X", "X", "X"],
                           4 => ["X", "X", "X", "X", "X", "X"],
                           5 => ["X", "X", "X", "X", "X", "X"],
                           6 => ["X", "X", "X", "X", "X", "X"],
                           7 => ["X", "X", "X", "X", "X"]
                          }

      expect(Game.new(almost_full_grid).draw?).to be_falsey
    end

    it "returns false if the game grid is empty" do
      expect(game.draw?).to be_falsey
    end
  end

  describe "#quit" do
    it "raises a SystemExit error and exits the game" do
      expect { game.quit }.to raise_error(SystemExit)
    end
  end
end