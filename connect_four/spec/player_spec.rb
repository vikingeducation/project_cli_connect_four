# public methods: marker, insert_disk
require_relative '../lib/player.rb'
describe Player do
  let(:human) { Player.new("x") }
  let(:board) { Board.new(3,3) }

  describe '#initialize' do
    it "returns a player" do
      expect(human).to be_a(Player)
    end
  end

  describe "#marker" do
    it "has a marker x" do
      expect(human.marker).to eq("x")
    end
  end
end