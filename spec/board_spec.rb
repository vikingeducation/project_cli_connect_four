require "./lib/connect_four/board"
require "./lib/connect_four/piece"
require "spec_helper"

describe Board do

  let(:board){Board.new}

  describe "#initialize" do
    it "initializes a board object" do
      expect(board).to be_a(Board)
    end

    it "initializes a blank board" do
      expect(board.verticals).to eq(Array.new(7){Array.new(6){[]}})
    end

    it "initializes a pre-made board with parameter" do
      new_board = Board.new([])
      expect(new_board.verticals).to eq([])
    end
  end

  describe "#update_board" do
    it "updates board with a Piece object" do
      board.update_board(0,"R")
      expect(board.verticals[0][0]).to be_a(Piece)
    end
  end

  describe "#bottom" do
    it "returns the bottom of the column" do
    
    end
  end




end
