require 'spec_helper'
require_relative '../player'
require_relative '../board'

describe Player do

  let(:board) {Board.new}

  subject do
    Player.new("x", board,"string")
  end

  context "after initialized" do

    describe "#name" do

      it "returns string" do
        expect(subject.name).to be_kind_of(String)
      end

      it "returns string entered on initialize" do
        expect(subject.name).to eq("string")
      end

    end

    describe "#game_piece" do

      it "returns string" do
        expect(subject.game_piece).to be_kind_of(String)
      end

      it "returns string entered on initialize" do
        expect(subject.game_piece).to eq("x")
      end

    end

  end

  describe "#move_piece" do

    before do
      # full column
      board.board[5][5], board.board[4][5], board.board[3][5],
      board.board[2][5], board.board[1][5], board.board[0][5] = "o", "o", "o", "x", "x", "x"
      # partially full column
      board.board[5][2], board.board[4][2], board.board[3][2] = "x", "o", "x"
      # column with only one space filled
      board.board[5][0] = "x"
    end

    context "given a column and a game_piece" do

      it "should ask the board to place the piece if column_full is false" do
        subject.move_piece(2, "x")
        expect(board.board[2][2]).to eq("x")
      end

      it "should re-run method if column_full is true" do
        # not sure how to test with out stubs etc.
      end

    end

  end


end
