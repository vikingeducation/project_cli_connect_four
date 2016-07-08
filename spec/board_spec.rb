require "board"
require 'piece'
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


  describe "#bottom(column)" do
    it "should return an empty array" do
      expect(board.bottom(0)).to eq(0)
    end
  end

  describe "#verticals" do
    it "should return an array of all the columns" do
      expect(board.verticals).to eq(Array.new(7){Array.new(6){[]}})
    end
  end


  describe '#update_board(column, color)' do
    let(:red_piece) {Piece.new("R")}

    it "should should update the board with a placed piece" do
      expect(board.update_board(0, red_piece.color)).to eq(board.instance_variable_get(:@grid)[0][0])
    end

  end

  describe "#horizontals" do
    it "should return an array of all the rows" do
      expect(board.horizontals).to eq(Array.new(6){Array.new(7){[]}})
    end

    it "should not return an array of columns" do
      expect(board.horizontals).to_not eq(Array.new(7){Array.new(6){[]}})
    end
  end

  describe '#rising_diagonals' do
    it 'should return an array # of rising diagonals' do
        expect(board.rising_diagonals.length).to eq(6)
    end

    it 'should return an array' do
        expect(board.rising_diagonals).to be_a(Array)
    end

    it 'should return an array of arrays' do
        expect(board.rising_diagonals[0]).to be_a(Array)
    end

    it 'should produce an array of length six for rising diagonal array' do
      expect(board.rising_diagonals[0].length).to eq(6)
    end
  end

  describe 'falling_diagonals' do
    it 'should return an array # of falling diagonals' do
        expect(board.falling_diagonals.length).to eq(6)
    end

    it 'should return an array' do
        expect(board.falling_diagonals).to be_a(Array)
    end

    it 'should return an array of arrays' do
        expect(board.falling_diagonals[0]).to be_a(Array)
    end

    it 'should produce an array of length six for rising diagonal array' do
      expect(board.falling_diagonals[0].length).to eq(4)
    end
  end
end
