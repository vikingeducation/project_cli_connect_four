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
end