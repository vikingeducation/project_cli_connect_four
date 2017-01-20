# Tests for game class
# spec/game_spec.rb
require 'spec_helper'
require 'game'
include Connect_Four

describe Game do
  let(:game){Game.new}
  

  # describe "#opponent_prompt" do

  #   it "set player2 to human" do
  #     allow(game).to receive(:gets).and_return("1")
  #     game.opponent_prompt("R")
  #     expect(game.player_2.class).to eq(Human)
  #   end

  #   it "set player2 to Computer" do
  #     allow(game).to receive(:gets).and_return("2")
  #     game.opponent_prompt("R")
  #     expect(game.player_2.class).to eq(Computer)
  #   end

  #   it "loop until input valid" do
  #     allow(game).to receive(:gets).and_return("3", "2")
  #     game.opponent_prompt("R")
  #     expect(game.player_2.class).to eq(Computer)
  #   end

  #   it "loop until input valid" do
  #     allow(game).to receive(:gets).and_return("3", "1")
  #     game.opponent_prompt("R")
  #     expect(game.player_2.class).to eq(Human)
  #   end

  # end


  describe "#switch_players" do
    it "switches player" do
      expect(game.switch_players).to eq(game.player2)
    end
    it "switches player 2" do
      expect(game.switch_players).to eq(game.player1)
    end
  end
end
