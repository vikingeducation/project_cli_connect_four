require "board"
require "spec_helper"

RSpec.describe Board do

  let(:board){Board.new}

  describe "#initialize" do
    it "does not initiaize a board with input supplied" do
      expect {Board.new([])}.to raise_error ArgumentError
    end

    it "initializes a board object" do
      expect(board).to be_a(Board)
    end

    it 'provides board with proper dimensions' do
      grid = board.instance_variable_get(:@grid)
      expect(grid.length).to eq(7)
      grid.each do |row|
        expect(row.length).to eq(6)
      end
    end
  end

  describe 'subject' do

  end

end
