# spec/human_spec.rb

require 'player'
require 'human'
include ConnectFour

describe "Human" do
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

  describe "#choose_column" do
    
  end
end