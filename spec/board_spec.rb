require 'rspec'
require_relative '../lib/board'

describe Board do
  before do

  end
  let(:winning_board){["X", "X", "X", "X", nil, nil]}

  describe "#initialize" do
    it "should take a board as an argument" do
      expect(Board.new(winning_board).board).to eq(winning_board)
    end
  end
end