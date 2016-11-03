require 'rspec'
require_relative '../lib/board'

describe Board do
  before do

  end
  let(:horizontal){ [['X'] * 4 ] }
  let(:vertical){ [['X','X','X','X','X']] }
  let(:diagnoal){ }
  let(:winning_board){Array.new(7){["X", "X", "X", "X", nil, nil]}}

  describe "#initialize" do
    it "should take a board as an argument" do
      expect(Board.new(winning_board).board).to eq(winning_board)
    end

    it "should create a blank board without any arguments" do 
      expect(Board.new.board).to eq(Array.new(7){ Array.new(6) })
    end
  end

  describe "#winner?" do 
    let(:board){ Board.new(winning_board) }
    let(:piece){ [0,0] }
    it "should return true if there is a winner" do 
      expect(board.winner?(piece)).to be true
    end


  end
end