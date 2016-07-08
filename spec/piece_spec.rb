require "./lib/connect_four/piece"

describe Piece do

  let(:piece){Piece.new("R")}

  describe "#initialize" do
    it "Initializes a new piece" do
      expect(piece).to be_a(Piece)
    end

    it "Initializes with a color input" do
      expect(Piece.new("B")).to be_a(Piece)
    end

  end

  describe "#color" do
    it "returns the color of the piece" do
      expect(piece.color).to eq("R")
    end
  end

  describe "#empty?" do
    it "returns false" do
      expect(piece.empty?).to eq(false)
    end
  end
end