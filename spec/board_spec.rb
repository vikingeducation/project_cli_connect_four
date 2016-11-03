require 'rspec'
require_relative '../lib/board'

describe Board do

  let(:horizontal){ [['X'] * 4 ] }
  let(:vertical){ [['X','X','X','X']] }
  let(:neg_diagonal) do
    [
      [nil, nil, nil, "X"],
      [nil, nil, "X", nil],
      [nil, "X", nil, nil],
      ["X", nil, nil, nil]
    ]
  end
  let(:pos_diagonal) do
    [
      ["X", nil, nil, nil],
      [nil, "X", nil, nil],
      [nil, nil, "X", nil],
      [nil, nil, nil, "X"]
    ]
  end

  let(:custom_board){[["X", nil, nil, nil]]}

  describe "#initialize" do
    it "should take a board as an argument" do
      expect(Board.new(custom_board).board).to eq(custom_board)
    end

    it "should create a blank board without any arguments" do 
      expect(Board.new.board).to eq(Array.new(7){ Array.new(6) })
    end
  end

  describe "#winner?" do 
    let(:piece){ [0,0] }

    it "should return false if there is not a winner" do
      expect(Board.new(custom_board).winner?(piece)).to be false
    end

    it "should check if there is a horizontal winner" do
      expect(Board.new(horizontal).winner?(piece)).to be true
    end

    it "should check if there is a vertical winner" do
      expect(Board.new(vertical).winner?(piece)).to be true
    end

    it "should check if there is a positve diagonal winner" do 
      expect(Board.new(pos_diagonal).winner?(piece)).to be true
    end

    it "should check if there is a negative diagonal winner" do
      expect(Board.new(neg_diagonal).winner?([0,4])).to be true
    end

  end
end