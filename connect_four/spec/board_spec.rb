require 'spec_helper'
require_relative '../lib/board.rb'

describe "Board" do 
  let(:board){ Board.new }

  describe "#column_full?" do

    it "return false for column that is not full" do
      board.setup
      expect(board.column_full?(1)).to eq(false)
    end

    it "return true for column that is full" do
      board.test_draw
      expect(board.column_full?(5)).to eq(true)
    end

  end

  describe "#board_full?" do

    it "returns false for board that is not full" do
      board.setup
      expect(board.board_full?).to eq(false)
    end

    it "returns true for board that is full" do
      board.test_draw
      expect(board.board_full?).to eq(true)
    end

  end

  describe "#check_vertical?" do

    it "returns false if there are no wins vertically" do
      board.setup
      expect(board.check_vertical?(1)).to eq(false)
    end

    it "returns true if there is a vertical win" do
      board.test_left
      board.board[3][3] = "B"
      expect(board.check_vertical?(3)).to eq(true)
    end 

  end

  describe "#check_three?" do

    it "returns false if array doesn't include three in a row" do
      expect(board.check_three?(["BRB0"])).to eq(false)
    end

    it "returns true if array includes a three in a row" do
      expect(board.check_three?(["RRR0"])).to eq(3)
    end

  end

  describe "diagonal winning checks" do

    describe "right diagonal" do

      before "setup right diagonal board" do
        board.test_right
      end

      describe "#check_diagonal_upper_right" do

        it "creates an upper right diagonal array" do
          expect(board.check_diagonal_upper_right(3,4)).to eq(["0", "0", "0"])
        end

      end

      describe "#check_diagonal_lower_left" do

        it "creates a lower left diagonal array" do
          expect(board.check_diagonal_lower_left(3,4)).to eq(["R", "R", "R"])
        end 

      end

      describe "#get_diagonal_right" do

        it "it combines the diagonal arrays in the correct sequence" do
          expect(board.get_diagonal_right(3,4)).to eq(["R", "R", "R", "0", "0", "0"])
        end

      end

    end

  end




  
end