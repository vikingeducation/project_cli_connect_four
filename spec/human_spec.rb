require "./lib/connect_four/player"
require "./lib/connect_four/board"
require "./lib/connect_four/human"

describe Human do

  let(:human){Human.new("John","R",Board.new)}

  describe "#initialize" do
    it "initializes a new Human object" do
      expect(human).to be_a(Human)
    end
  end

  describe "#make_move" do
    it ""
    allow(human).to receive(:gets).and_return("1", "2")
  end



end