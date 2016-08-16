require_relative '../lib/player'
describe Player do
  let(:player) { Player.new("Farruh", "F", "Board") }

  describe "#initialize" do
    it "should create new Player" do
      expect(player).to be_a(Player)
    end

    it "should have name" do
      expect(player.name).to eq("Farruh")
    end

    it "should have piece" do
      expect(player.piece).to eq("F")
    end
  end
end
