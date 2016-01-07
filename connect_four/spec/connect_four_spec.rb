require 'spec_helper'
require_relative '../lib/connect_four.rb'

describe "ConnectFour" do

  let(:game){ConnectFour.new}

  
  describe "#color_prompt" do

    before "listen for gets" do
      allow(game).to receive(:gets).and_return("r")
    end

    it "sets player color" do
      game.color_prompt
      expect(game.player_1.color).to eq("R")
    end

    it "instantiates a human player" do
      game.color_prompt
      expect(game.player_1.class).to eq(Human)
    end

  end

  describe "#opponent_prompt - human" do


    before "listen for gets" do
      allow(game).to receive(:gets).and_return("1")
    end

    it "set player2 to human" do
      game.opponent_prompt("R")
      expect(game.player_2.class).to eq(Human)
    end
  end

  describe "#opponent_prompt - computer" do
    
    before "listen for gets" do
      allow(game).to receive(:gets).and_return("2")
    end

    it "set player2 to Computer" do
      game.opponent_prompt("R")
      expect(game.player_2.class).to eq(Computer)
    end

  end

  describe "#opponent_color" do

    it "set player2 color opposite of player1"

  end

  describe "#switch_player" do

    it "switches player variable between opponents"

  end
end