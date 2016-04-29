require "spec_helper"
require "player"
require "human"

describe Human do
  let(:human) {Human.new("player1", :X)}

  describe "#make_move" do
    it "should return the move if valid" do
      allow(human).to receive(:gets).and_return("4")
      expect(human.make_move).to eq(4)
    end

    it "will loop until valid input" do
      allow(human).to receive(:gets).and_return("10", "g", "5")
      expect(human.make_move).to eq(5)
    end
  end
end