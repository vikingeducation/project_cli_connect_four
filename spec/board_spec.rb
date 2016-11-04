require 'rspec'
require_relative '../lib/board'

describe Board do

  let(:small_board){ [ ['X','X','X'], 
                       ['0','0','0'] ] }

  let(:small_board_transposed){ [ ['X','0'], 
                                  ['X','0'],
                                  ['X','0'] ] }                     

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
  let(:close){ [['X','X','X',nil]] }
  let(:cant_win){ [['X','X','X','O']] }

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
    let(:placement){ [0,0] }

    it "should return false if there is not a winner" do
      expect(Board.new(custom_board).winner?(placement)).to be false
    end

    it "should check if there is a horizontal winner" do
      expect(Board.new(horizontal).winner?(placement)).to be true
    end

    it "should check if there is a vertical winner" do
      expect(Board.new(vertical).winner?(placement)).to be true
    end

    it "should check if there is a positve diagonal winner" do 
      expect(Board.new(pos_diagonal).winner?(placement)).to be true
    end

    it "should check if there is a negative diagonal winner" do
      expect(Board.new(neg_diagonal).winner?([0,3])).to be true
    end
  end

  describe "#close_to_win" do 

    it "should return a column number if a player is about to win vertically" do 
      expect(Board.new(close).close_to_win('X')).to eq(0)
    end

    it "should return false if a player a can't win" do 
      expect(Board.new(cant_win).close_to_win('O')).to be false
    end
  end

  describe "#full?" do 
    it "should return true if the board is full" do 
      expect(Board.new(vertical).full?).to be true
    end

    it "should return false if the board is not full" do 
      expect(Board.new(neg_diagonal).full?).to be false
      expect(Board.new(close).full?).to be false
    end
  end

  describe "#rows" do 
    it "should convert columns into rows and rows into columns" do 
      expect(Board.new(small_board).rows).to eq(small_board_transposed)
    end
  end
end