require "spec_helper"
require "player"
require "ai"

describe Ai do
  let(:ai) {Ai.new("player1", :X)}

  describe "#make_move" do
    it "should return a move between 1 and 7" do
      expect((1..7)).to include(ai.make_move)
    end
  end
end