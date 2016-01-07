require 'spec_helper'
require_relative '../lib/connect_four.rb'

describe "ConnectFour" do

  let(:game){ConnectFour.new}

  describe "#color_prompt" do

    before "run color_prompt" do
      allow(color_prompt).to receive(:gets).and_return("r")
    end

    # allow(player).to receive(:gets).and_return("r")

    it "sets player color" do

      # expect{player.color}.to eq("R")
    end

    it "instantiates a player"

  end

  describe "#opponent_prompt" do

    it "set player2"

  end

  describe "#opponent_color" do

    it "set player2 color opposite of player1"

  end

  describe "#switch_player" do

    it "switches player variable between opponents"

  end
end