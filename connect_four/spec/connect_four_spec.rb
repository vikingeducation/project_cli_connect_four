require 'spec_helper'
require_relative '../lib/connect_four.rb'

describe "ConnectFour" do

  let(:game){ConnectFour.new}

  
  describe "#color_prompt" do

    it "sets player color" do
      allow(game).to receive(:gets).and_return("r")
      game.color_prompt
      expect(game.player_1.color).to eq("R")
    end

    it "instantiates a human player" do
      allow(game).to receive(:gets).and_return("r")
      game.color_prompt
      expect(game.player_1.class).to eq(Human)
    end

    it "loop until valid input" do
      allow(game).to receive(:gets).and_return("p", "c", "r")
      game.color_prompt
      expect(game.player_1.color).to eq("R")
    end
  end

  describe "#opponent_prompt" do

    it "set player2 to human" do
      allow(game).to receive(:gets).and_return("1")
      game.opponent_prompt("R")
      expect(game.player_2.class).to eq(Human)
    end

    it "set player2 to Computer" do
      allow(game).to receive(:gets).and_return("2")
      game.opponent_prompt("R")
      expect(game.player_2.class).to eq(Computer)
    end

    it "loop until input valid" do
      allow(game).to receive(:gets).and_return("3", "2")
      game.opponent_prompt("R")
      expect(game.player_2.class).to eq(Computer)
    end

    it "loop until input valid" do
      allow(game).to receive(:gets).and_return("3", "1")
      game.opponent_prompt("R")
      expect(game.player_2.class).to eq(Human)
    end

  end

  describe "#opponent_color" do

    it "set player2 color opposite of player1" do
      expect(game.opponent_color("B")).to eq("R")
    end
    
    it "set player2 color opposite of player1" do
      expect(game.opponent_color("R")).to eq("B")
    end

  end

  describe "#switch_player" do

    it "switches player variable between opponents" do
      expect(game.switch_player(game.player_1)).to eq(game.player_2)
    end

    it "switches player variable between opponents" do
      expect(game.switch_player(game.player_2)).to eq(game.player_1)
    end
  end
end