require 'rspec'
require_relative '../lib/render'

describe Render do
  let(:small_board){ 
    [ 
      ['X','0'], 
      ['X','0'],
      ['X','0'] 
    ] 
  }
  describe ".board" do

    it "should properly format the board" do
      expect(Render).to receive(:clear).exactly(:once)
      expect(Render).to receive(:spacing).exactly(:twice)
      expect(Render).to receive(:column_numbers).exactly(:twice)
      expect(Render).to receive(:format_cells).exactly(small_board.length).times
      Render.board(small_board)
    end
  end

  describe ".column_numbers" do
    it "should print column numbers" do
      expect(Render).to receive(:puts).with("- 1 - 2 - 3 - 4 - 5 - 6 - 7 -")
      Render.column_numbers
    end
  end

  describe ".format_cells" do
    it "should a formatted row" do
      expect(Render).to receive(:print).with("| X ").exactly(3).times
      expect(Render).to receive(:puts).with("|")
      Render.format_cells(["X", "X", "X"])
    end
  end

  describe ".placement" do
    it "should ask the player to pick a place" do 
      expect(Render).to receive(:puts).with("Enter the column in which you want to place a piece")
      Render.placement
    end
  end

  describe ".spacing" do
    it "should space out the board" do
      expect(Render).to receive(:puts).with("\n\n")
      Render.spacing
    end
  end

  describe ".winner" do
    it "should display the winner" do 
      expect(Render).to receive(:puts).with("########GAMER OVER########\n\n")
      expect(Render).to receive(:puts).with("Player 1 wins!\n\n")
      Render.winner("Player 1")
    end
  end

end