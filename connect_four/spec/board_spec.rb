
require 'spec_helper'
require 'execute'

describe Board do
  let(:board) {Board.new}
  describe "#initialize" do
    it "has a layout" do
      expect(board.instance_variable_get(:@layout)).to be_a(Array)
    end

    it "has a last move" do
      expect(board.instance_variable_get(:@last_move)).to eq(nil)
    end
  end

  describe "#full?" do
     it "returns false if the board is not full" do
       expect(board.full?).to eq(false)
     end

     it "returns true if the board is full" do
       board.layout = Array.new(7){Array.new(6) {'X'}}
       expect(board.full?).to eq(true)
     end
  end

  describe "layout" do
    it "Allows us to edit the layout instance variable" do
        board.layout = "Test"
        expect(board.instance_variable_get(:@layout)).to eq("Test")
    end

  end

end
