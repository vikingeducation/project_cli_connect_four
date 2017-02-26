# spec/game_controller_spec.rb

require 'grid'
require 'game'
require 'game_controller'
include ConnectFour

describe "GameController" do
  let (:game_controller) { GameController.new }

  describe "#initialize" do
    it "instantiates the Game object" do
      expect(game_controller.game).to be_a(Game)
    end

    it "instantiates the Game object with a custom grid" do
      custom_grid = { 1 => ["X"],
                      2 => ["X"],
                      3 => ["X"],
                      4 => ["X"],
                      5 => ["O"],
                      6 => ["O"],
                      7 => ["O"]
                    }

      game_controller = GameController.new(custom_grid)
      expect(game_controller.game.grid.grid).to eq(custom_grid)
    end
  end
end