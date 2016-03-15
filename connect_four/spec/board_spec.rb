require "spec_helper"
require "board"

describe Board do

  describe "#initialize" do
    it "should not raise an error if no arg" do
      expect{b=Board.new}.to_not raise_error
    end

    it "should not raise an error if passing arg" do
      board={1 => ["X","O","X"]}
      expect{b=Board.new(board)}.to_not raise_error
    end

    it "should save arg if passes" do
      board={1 => ["X","O","X"]}
      b=Board.new(board)
      board_game = b.instance_variable_get(:@board_game)
      expect(board_game).to eq({1 => ["X","O","X"]})
    end
  end


  context "the board is empty" do
    let(:board){Board.new}

    describe "#full?" do
      it "return false if the board is empty" do
        expect(board.full?).to eq(false)
      end
    end

    describe "#move" do
      it "should make the move if valid" do
        board.move(3,:X)
        board_game = board.instance_variable_get(:@board_game)
        board_cell = board_game[6][2]
        expect(board_cell).to eq("X")
      end
    end
  end


  context "the board is full" do
    let(:board){Board.new(board = {
      1 => ["X", "O", "X", "O", "X", "O", "X"],
      2 => ["X", "O", "X", "O", "X", "O", "X"],
      3 => ["X", "O", "X", "O", "X", "O", "X"],
      4 => ["X", "O", "X", "O", "X", "O", "X"],
      5 => ["X", "O", "X", "O", "X", "O", "X"],
      6 => ["X", "O", "X", "O", "X", "O", "X"]})}

    describe "#full?" do
      it "return true if the board is full" do
        expect(board.full?).to eq(true)
      end
    end

    describe "#move" do
      context "full column" do
        it "should return false" do
          expect(board.move(3, :X)).to eq(false)
        end
      end
    end
  end

  describe "#victory?" do
    context "Win Situation" do
      context "when 4 horizontal X" do
        let(:board){Board.new(board = {
          1 => [" ", " ", " ", " ", " ", " ", " "],
          2 => [" ", " ", " ", " ", " ", " ", " "],
          3 => [" ", " ", " ", " ", " ", " ", " "],
          4 => ["X", "X", "X", "X", "O", "O", "X"],
          5 => ["X", "O", "X", "O", "X", "O", "X"],
          6 => ["X", "O", "X", "O", "X", "O", "X"]})}

        it "should return true" do
          expect(board.victory?(3,:X)).to eq(true)
        end
      end

      context "when 4 vertical O" do
        let(:board){Board.new(board = {
          1 => [" ", " ", " ", " ", " ", " ", " "],
          2 => [" ", " ", " ", " ", " ", " ", " "],
          3 => [" ", " ", " ", "O", " ", " ", " "],
          4 => ["X", "O", "X", "O", "X", "O", "X"],
          5 => ["X", "O", "X", "O", "X", "O", "X"],
          6 => ["X", "O", "X", "O", "X", "O", "X"]})}

        it "should return true" do
          expect(board.victory?(4,:O)).to eq(true)
        end
      end

      context "when 4 right diagonal O" do
        let(:board){Board.new(board = {
          1 => [" ", " ", " ", " ", " ", " ", " "],
          2 => [" ", " ", " ", " ", " ", " ", " "],
          3 => [" ", " ", " ", " ", "O", " ", " "],
          4 => ["X", "O", "X", "O", "X", "O", "X"],
          5 => ["X", "O", "O", "O", "X", "O", "X"],
          6 => ["X", "O", "X", "O", "X", "O", "X"]})}

        it "should return true" do
          expect(board.victory?(4,:O)).to eq(true)
        end
      end

      context "when 4 left diagonal X" do
        let(:board){Board.new(board = {
          1 => [" ", " ", " ", " ", " ", " ", " "],
          2 => [" ", " ", " ", " ", " ", " ", " "],
          3 => [" ", " ", "X", " ", " ", " ", " "],
          4 => ["X", "O", "X", "X", "X", "O", "X"],
          5 => ["X", "O", "O", "O", "X", "O", "X"],
          6 => ["X", "O", "X", "O", "X", "X", "X"]})}

        it "should return true" do
          expect(board.victory?(3,:X)).to eq(true)
        end
      end
    end

    context "No Win Situation" do
      let(:board){Board.new(board = {
          1 => [" ", " ", " ", " ", " ", " ", " "],
          2 => [" ", " ", " ", " ", " ", " ", " "],
          3 => [" ", " ", " ", " ", " ", " ", " "],
          4 => ["X", "O", "O", "X", "X", "X", "O"],
          5 => ["X", "O", "O", "O", "X", "O", "X"],
          6 => ["O", "O", "X", "O", "X", "X", "X"]})}

      context "when 3 horizontal X" do
        it "should not return true" do
          expect(board.victory?(6, :X)).not_to eq(true)
        end
      end

      context "when 3 vertical 0" do
        it "should not return true" do
          expect(board.victory?(2, :O)).not_to eq(true)
        end
      end

      context "when 3 left diagonal X" do
        it "should not return true" do
          expect(board.victory?(4, :X)).not_to eq(true)
        end
      end

      context "when 3 right diagonal O" do
        it "should not return true" do
          expect(board.victory?(3, :O)).not_to eq(true)
        end
      end
    end
  end

end