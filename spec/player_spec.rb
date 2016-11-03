require 'rspec'
require_relative '../lib/player'

describe Player do 
  
  describe "piece" do 
    it "should start as nil" do 
      expect(Player.new.piece).to be_nil
    end

    it "should be able to get and set a piece" do 
      player = Player.new
      player.piece = 'X'
      expect(player.piece).to eq('X')
    end
  end

  describe "#placement" do 
    it "should get a placement from the player" do 
      player = Player.new
      allow(player).to receive(:gets).and_return("1")
      expect(player.placement).to eq(0)
    end

    it "should ask the player to pick a place" do 
      player = Player.new
      allow(STDOUT).to receive(:puts).with("Enter the column in which you want to place a piece")
      player.placement
    end
  end
end