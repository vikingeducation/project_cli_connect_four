require "./lib/connect_four/player"
require "./lib/connect_four/board"

describe Player do

  let(:player){Player.new("John","R",Board.new)}

  describe "#initialize" do
    it "Initializes a new player" do
      expect(player).to be_a(Player)
    end

    it "raises errors when parameters for name, color, and board are not present" do
      expect{Player.new("Luke")}.to raise_error(ArgumentError)
    end
  end

  describe "#name" do
    it "returns name of player" do
      expect(player.name).to eq("John")
    end
  end

end
