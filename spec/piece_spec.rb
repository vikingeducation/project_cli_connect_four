require 'spec_helper'

RSpec.describe Piece do
  subject(:piece_no_color) {Piece.new()}
  subject(:piece) {Piece.new("R")}

  describe "initialize" do
    it "raise error if no color is given" do
      expect {piece_no_color}.to raise_error ArgumentError
    end

    it "store color into piece" do
      expect(piece.color).to eq("R")
    end
  end

  describe "#empty?" do
    it "return false because the space will not be empty with the piece" do
      expect(piece.empty?).to be false
    end
  end

end
