# Tests for game class
# spec/game_spec.rb
require 'game'
include Connect_Four

describe Game do
  let(:game){Game.new}
  
  describe "#switch_players" do
    it "switches player" do
      expect(game.switch_players).to eq(game.player2)
    end
    it "switches player 2" do
      expect(game.switch_players).to eq(game.player1)
    end
  end
end
