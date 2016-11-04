require 'spec_helper'
require 'execute'

describe Player do
   let(:player) {Player.new(Board.new,'O')}
   describe "#initilaize" do
     it "has a board global variable" do
       expect(player.instance_variable_get(:@board)).to be_a(Board)
     end

     it "has a piece global variable" do
       expect(player.instance_variable_get(:@piece)).to be_a(String)
     end
  end

  describe "#piece" do
    it "shows us what the piece is" do
      expect(player.piece).to eq(player.instance_variable_get(:@piece))
    end
  end
end
