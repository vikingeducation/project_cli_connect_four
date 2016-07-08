require "./lib/connect_four/player"
require "./lib/connect_four/board"
require "./lib/connect_four/piece"
require "./lib/connect_four/human"

describe Human do
  let(:board){Board.new}
  let(:human){Human.new("John","R", board)}

  describe "#initialize" do
    it "initializes a new Human object" do
      expect(human).to be_a(Human)
    end
  end

  describe "#make_move" do
    it "passes human to @board.update" do
      allow(human).to receive(:gets).and_return("1")
      human.make_move
      expect(board.verticals[0][0]).to be_a(Piece)
    end
  end



end
