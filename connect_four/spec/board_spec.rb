require 'spec_helper'
require_relative '../board'

describe Board do

  let(:board){ Board.new }

  describe "#board" do

    it "should create board structure fulled with nil values saved in instance variable" do
      expect(board.board).to eq(Array.new(6, Array.new(7, nil)))
    end

  end

  describe "#place_piece" do

    context "for given column" do

      it "changes nil to 'x' for player 1" do
        board.place_piece(3, "x")
        expect(board.board[5][3]).to eq("x")
      end

      it "changes nil to 'o' for player 2" do
        board.place_piece(0, "o")
        expect(board.board[5][0]).to eq("o")
      end

      it "places piece in the highest row number without a piece" do
        board.board[5][2] = "x"
        board.place_piece(2, "o")
        expect(board.board[4][2]).to eq("o")
      end

      it "will not place a piece in a cell that does not equal nil" do
        board.board[5][2] = "x"
        board.place_piece(2, "o")
        expect(board.board[5][2]).to eq("x")
      end

    end

  end

  describe "#board_full?" do
    before do
      board.board.each do |row|
        row.map! { |x| x = "x" }
      end
    end

    it "should return false at start of game" do
      board = Board.new
      expect(board.board_full?).to eq(false)
    end

    it "should return true if every cell on the board contains a piece" do
      expect(board.board_full?).to eq(true)
    end

    it "should return false if any cell on the board contains nil" do
      board.board[0][1] = nil
      expect(board.board_full?).to eq(false)
    end

  end

  describe "#column_full?" do

    before do
      board.board.each do |row|
        row.map! {|x| x = "x"}
      end
    end

    it "should return false at start of game" do
      board = Board.new
      expect(board.column_full?(1)). to eq(false)
    end

    it "should return true if given column has a piece in each cell" do
      expect(board.column_full?(3)).to eq(true)
    end

    it "should return false if given column has nil in at least one cell" do
      board.board[0][0] = nil
      expect(board.column_full?(0)).to eq(false)
    end

  end

  describe "#winning_combo?" do

    before do
      # example of horizontal win
      board.board[5][0],board.board[5][1],board.board[5][2],board.board[5][3]  = "x", "x", "x", "x"
      board.board[5][4],board.board[5][5],board.board[5][6] = "o","o","o"
      # example of vertical win
      board.board[4][5], board.board[3][5], board.board[2][5] = "o", "o", "o"
      # example of diagonal win
      board.board[3][4], board.board[2][3] = "o", "o"
      board.board[4][4], board.board[4][3], board.board[3][3] = "x", "x", "x"
    end

    context "for given piece and column" do

      it "returns true if there is a winning horizontal pattern" do
        expect(board.winning_combo?(0, "x")).to eq(true)
      end

      it "returns true if there is a winning vertical pattern" do
        expect(board.winning_combo?(5,"o")).to eq(true)
      end

      it "returns true if there is a winning diagonal pattern" do
        expect(board.winning_combo?(3, "o")).to eq(true)
      end

      it "returns false if there is is no winning pattern" do
        expect(board.winning_combo?(3,"x")).to eq(false)
      end

    end

  end

  describe "#board_column" do

    before do
      board.board[5][5], board.board[4][5], board.board[3][5], board.board[2][5],
      board.board[1][5], board.board[0][5] = "o", "o", "o", "x", nil, nil
    end

    context "given a column number" do

      it "takes an integer and returns an array" do
        expect(board.board_column(3)).to be_kind_of(Array)
      end

      it "returns the array for the column" do
        expect(board.board_column(5)).to eq([nil, nil, "x","o", "o", "o"])
      end

      it "returns array of nil values when the column is empty" do
        expect(board.board_column(0)).to eq(Array.new(6, nil))
      end

    end

  end


end
