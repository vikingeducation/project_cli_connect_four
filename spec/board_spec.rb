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
      grid = board.grid
      expect(grid.length).to eq(7)
      grid.each do |row|
        expect(row.length).to eq(6)
      end
    end
  end


  describe "#bottom(column)" do
    it "will return the index of the bottom of the column that will be empty" do
      expect(board.bottom(0)).to eq(0)
    end
  end

  describe "#verticals" do
    it "will return an array of empty arrays of all the columns of the board" do
      expect(board.verticals).to eq(Array.new(7){Array.new(6){[]}})
    end
  end


  describe '#update_board(column, color)' do
    let(:red_piece) {Piece.new("R")}

    it "will update the board with a placed piece by the player" do
      expect(board.update_board(0, red_piece.color)).to be_a(Piece)
    end

  end

  describe "#horizontals" do
    it "will return an array of empty arrays all the columns of the board" do
      expect(board.horizontals).to eq(Array.new(6){Array.new(7){[]}})
    end

    it "will return an array of the arrays of rows of the board instead of the columns" do
      expect(board.horizontals).to_not eq(Array.new(7){Array.new(6){[]}})
    end
  end

  describe '#rising_diagonals' do
    it 'will return an the number of rising diagonals of the board' do
        expect(board.rising_diagonals.length).to eq(6)
    end

    it 'will return the type of-- an Array-- of the rising diagonal' do
        expect(board.rising_diagonals).to be_a(Array)
    end

    it 'will return an array of arrays' do
        expect(board.rising_diagonals[0]).to be_a(Array)
    end

    it 'will produce an array of length six for rising diagonal array' do
      expect(board.rising_diagonals[0].length).to eq(6)
    end
  end

  describe 'falling_diagonals' do
    it 'will return an array # of falling diagonals' do
        expect(board.falling_diagonals.length).to eq(6)
    end

    it 'will return an array' do
        expect(board.falling_diagonals).to be_a(Array)
    end

    it 'will return an array of arrays of the falling diagonals' do
        expect(board.falling_diagonals[0]).to be_a(Array)
    end

    it 'will produce an array of length four for rising diagonal array' do
      expect(board.falling_diagonals[0].length).to eq(4)
    end
  end
end
