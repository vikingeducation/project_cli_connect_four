require "./lib/connect_four/board"
require "./lib/connect_four/piece"
require "spec_helper"

describe Board do

  let(:board){Board.new}
  let(:partial_board){Board.new([[Piece.new("R"), Piece.new("R"), Piece.new("R"), Piece.new("R"), Piece.new("R"), Piece.new("R")],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []]])}

  describe "#initialize" do
    it "initializes a board object" do
      expect(board).to be_a(Board)
    end

    it "initializes a blank board" do
      expect(board.verticals).to eq(Array.new(7){Array.new(6){[]}})
    end

    it "initializes a pre-made board with parameter" do
      new_board = Board.new([])
      expect(new_board.verticals).to eq([])
    end
  end

  describe "#update_board" do
    it "updates board with a Piece object" do
      board.update_board(0,"R")
      expect(board.verticals[0][0]).to be_a(Piece)
    end
  end

  describe "#bottom" do
    it "returns the bottom of the column" do
      expect(board.bottom(1)).to eq(0)
    end

    it "returns lowest available space" do
      board.update_board(1, "R")
      expect(board.bottom(1)).to eq(1)
    end
  end

  describe "#horizontals" do
    it "returns a transposed board" do
      expect(partial_board.horizontals).not_to eq(partial_board.verticals)
    end
  end

  describe "#verticals" do
    it "returns the board" do
      expect(board.verticals).to eq(Array.new(7){Array.new(6){[]}})
    end
  end

  describe "#rising_diagonals" do
    let(:r_diagonals) {[[[], [], [], [], [], []],
 [[], [], [], [], []],
 [[], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], []],
 [[], [], [], []]]}

    it "returns the rising diagonals of the board" do
      expect(board.rising_diagonals).to eq(r_diagonals)
    end
  end

  describe "#falling_diagonals" do
    let(:f_diagonals) {[[[], [], [], []],
 [[], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], [], []],
 [[], [], [], [], []],
 [[], [], [], []]]}

    it "returns the falling diagonals of the board" do
      expect(board.falling_diagonals).to eq(f_diagonals)
    end
  end




end
