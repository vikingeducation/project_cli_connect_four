require 'board'

describe "Board" do

  let(:board) { Board.new }
  let(:empty_spaces) { [  ["-","-","-","-","-","-"],
                          ["-","-","-","-","-","-"],
                          ["-","-","-","-","-","-"],
                          ["-","-","-","-","-","-"],
                          ["-","-","-","-","-","-"],
                          ["-","-","-","-","-","-"],
                          ["-","-","-","-","-","-"] ] }

  let(:full_board) { [    ["B", "B", "B", "R", "R", "R"],
                          ["R", "R", "R", "B", "B", "B"],
                          ["B", "B", "B", "R", "R", "R"],
                          ["R", "R", "R", "B", "B", "B"],
                          ["B", "B", "B", "R", "R", "R"],
                          ["R", "R", "R", "B", "B", "B"],
                          ["B", "B", "B", "R", "R", "R"] ] }

  let(:red_horizontal) { [  ["-","-","-","-","-","-"],
                            ["-","-","-","-","-","B"],
                            ["-","-","-","-","-","R"],
                            ["-","-","-","-","-","R"],
                            ["-","-","-","-","B","R"],
                            ["-","-","-","-","-","R"],
                            ["-","-","-","-","-","B"] ] }

  let(:black_horizontal) { [  ["-","-","-","-","-","R"],
                              ["-","-","-","-","-","B"],
                              ["-","-","-","-","-","B"],
                              ["-","-","-","-","-","B"],
                              ["-","-","-","-","R","B"],
                              ["-","-","-","-","-","R"],
                              ["-","-","-","-","-","R"] ] }

  describe "#initialize" do
    it "creates a board" do
      expect(board).to be_a(Board)
    end

    it "initializes piece count to 0" do
      expect(board.piece_count).to eq(0)
    end

    it "initializes grid to an empty grid" do
      expect(board.grid).to eq(empty_spaces)
    end
  end

  describe "#empty_grid" do
    it "returns an array of empty spaces" do
      expect(board.empty_grid).to eq(empty_spaces)
    end
  end

  describe "#team_to_piece" do
    it "returns R for red" do
      expect(board.team_to_piece("red")).to eq("R")
    end

    it "returns B for black" do
      expect(board.team_to_piece("black")).to eq("B")
    end
  end

  describe "#add_piece" do
    it "adds a red piece to the given column" do
      board.add_piece("red",3)
      col = 3
      row = 5
      expect(board.grid[col][row]).to eq("R")
    end

    it "adds a black piece to the given column" do
      board.add_piece("black",5)
      col = 5
      row = 5
      expect(board.grid[col][row]).to eq("B")
    end
  end

  describe "#to_s" do
    it "returns a string" do
      expect(board.to_s).to be_a(String)
    end

    it "returns a string representation of an empty board" do
      string_board = "-------\n-------\n-------\n-------\n-------\n-------\n"
      expect(board.to_s).to eq(string_board)
    end

    it "returns a string representation of a non-empty board" do
      string_board = "-------\n-------\n-------\n-------\n-------\n---RB--\n"
      board.add_piece("red", 3)
      board.add_piece("black", 4)
      expect(board.to_s).to eq(string_board)
    end
  end

  describe "#check_game_status" do
    it "returns draw if there is a draw (full board)"
    it "returns red if red has four in a row"
    it "returns black if black has four in a row"
    it "returns false if the game is incomplete"
  end

  describe "#board_full?" do
    it "returns true if the board is full"
    it "returns false if the board is not full"
  end

  describe "#win?" do

  end

  describe "#horizontal_win?" do

  end

  describe "#vertical_win?" do

  end

  describe "#diagonal_win?" do

  end

end
