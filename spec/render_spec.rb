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
end