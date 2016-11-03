
require 'spec_helper'
require 'execute'

describe Board do
  let(:board) {Board.new}
  let(:layout) { board.layout }

  describe "#initialize" do
    it "has a layout" do
      expect(layout).to be_a(Array)
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

  describe "#layout=" do
    it "Allows us to edit the layout instance variable" do
        board.layout = "Test"
        expect(board.instance_variable_get(:@layout)).to eq("Test")
    end
  end

  describe "#layout" do
    it "Allows us to access the layout" do
      board.layout = "asdf"
      expect(board.layout).to eq("asdf")
    end
  end

  describe "#last_move=" do
    it "Allows us to edit the last_move instance variable" do
        board.last_move = "Test"
        expect(board.instance_variable_get(:@last_move)).to eq("Test")
    end
  end

  describe "#last_move" do
    it "Allows us to access the last_move" do
      board.last_move = "asdf"
      expect(board.last_move).to eq("asdf")
    end
  end

  describe "add_piece" do
    it "stores the last move" do
      board.add_piece(1, 'X')
      expect(board.last_move).to eq([0,0])
    end

    it "adds a piece to the board" do
      board.add_piece(1, 'X')
      expect(board.layout[0][0]).to eq('X')
    end

  end

  describe "#full_column?" do
    it "returns true if the column is full" do
      sequence = board.full_column?(Array.new(6) { 'X' })
      expect(sequence).to be true
    end

    it "returns false if the column is not full" do
      sequence = (Array.new(5) { '_' })
      sequence.unshift('X')
      expect(board.full_column?(sequence)).to be false
    end

  end

  describe "#four_connected?" do
    it "returns false if no winning move" do
      board.last_move = [0,0]
      board.layout[0][0] = 'X'
      expect(board.four_connected?).to be false
    end
  end



end
