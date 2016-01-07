require 'board'

describe "Board" do

  let(:empty_grid) { [                  ["-","-","-","-","-","-"],
                                        ["-","-","-","-","-","-"],
                                        ["-","-","-","-","-","-"],
                                        ["-","-","-","-","-","-"],
                                        ["-","-","-","-","-","-"],
                                        ["-","-","-","-","-","-"],
                                        ["-","-","-","-","-","-"] ] }

  let(:board) { Board.new }

  let(:full_board) { Board.new( [       ["B","B","B","R","R","R"],
                                        ["R","R","R","B","B","B"],
                                        ["B","B","B","R","R","R"],
                                        ["R","R","R","B","B","B"],
                                        ["B","B","B","R","R","R"],
                                        ["R","R","R","B","B","B"],
                                        ["B","B","B","R","R","R"] ] ) }

  let(:red_horizontal) { Board.new( [   ["-","-","-","-","-","-"],
                                        ["-","-","-","-","-","B"],
                                        ["-","-","-","-","-","R"],
                                        ["-","-","-","-","-","R"],
                                        ["-","-","-","-","B","R"],
                                        ["-","-","-","-","-","R"],
                                        ["-","-","-","-","-","B"] ]) }

  let(:black_horizontal) { Board.new( [ ["-","-","-","-","-","R"],
                                        ["-","-","-","-","-","B"],
                                        ["-","-","-","-","-","B"],
                                        ["-","-","-","-","-","B"],
                                        ["-","-","-","-","R","B"],
                                        ["-","-","-","-","-","R"],
                                        ["-","-","-","-","-","R"] ] ) }

  let(:black_vertical) { Board.new(   [ ["-","-","-","-","-","B"],
                                        ["-","-","-","-","-","R"],
                                        ["-","-","-","-","-","R"],
                                        ["-","-","-","-","-","R"],
                                        ["-","-","B","B","B","B"],
                                        ["-","-","-","-","-","R"],
                                        ["-","-","-","-","-","R"] ] ) }

  let(:red_vertical) { Board.new(     [ ["-","-","-","-","-","B"],
                                        ["-","-","-","-","-","B"],
                                        ["-","-","-","-","-","R"],
                                        ["-","-","-","-","-","B"],
                                        ["-","-","R","R","R","R"],
                                        ["-","-","-","-","-","B"],
                                        ["-","-","-","-","-","R"] ] ) }

  let(:red_diagonal) { Board.new(     [ ["-","-","-","-","-","B"],
                                        ["-","-","-","-","-","R"],
                                        ["-","-","-","-","R","R"],
                                        ["-","-","-","R","B","B"],
                                        ["-","-","R","B","B","R"],
                                        ["-","-","-","-","-","B"],
                                        ["-","-","-","-","-","R"] ] ) }

  let(:black_diagonal) { Board.new(   [ ["-","-","-","-","-","R"],
                                        ["-","-","-","-","-","B"],
                                        ["-","-","-","-","B","R"],
                                        ["-","-","-","B","R","B"],
                                        ["-","-","B","R","B","R"],
                                        ["-","-","-","-","-","B"],
                                        ["-","-","-","-","-","R"] ] ) }

describe "#initialize" do
    it "creates a board" do
      expect(board).to be_a(Board)
    end

    it "initializes grid to an empty grid" do
      expect(board.instance_variable_get(:@grid)).to eq(empty_grid)
    end
  end

  describe "#empty_grid" do
    it "returns an array of empty spaces" do
      expect(board.empty_grid).to eq(empty_grid)
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
      expect(board.retrieve_piece(col,row)).to eq("R")
    end

    it "adds a black piece to the given column" do
      board.add_piece("black",5)
      col = 5
      row = 5
      expect(board.retrieve_piece(col,row)).to eq("B")
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
    it "returns draw if there is a draw (full board)" do
      expect(full_board.check_game_status).to eq("draw")
    end

    it "returns red if red has won" do
      expect(red_horizontal.check_game_status).to eq("red")
    end

    it "returns black if black has won" do
      expect(black_vertical.check_game_status).to eq("black")
    end

    it "returns false if the game is incomplete" do
      expect(board.check_game_status).to eq(false)
    end
  end

  describe "#board_full?" do
    it "returns true if the board is full" do
      expect(full_board.board_full?).to eq(true)
    end
    it "returns false if the board is empty" do
      expect(board.board_full?).to eq(false)
    end
    it "returns false if the board has some pieces but is not full" do
      board.add_piece("red", 3)
      board.add_piece("black", 4)
      expect(board.board_full?).to eq(false)
    end
    it "returns false for a winning board with empty spaces" do
      expect(red_horizontal.board_full?).to eq(false)
    end
  end

  describe "#win?" do
    it "returns true if a horizontal win" do
      expect(red_horizontal.win?("red")).to eq(true)
    end

    it "returns true if a vertical win" do
      expect(black_vertical.win?("black")).to eq(true)
    end

    it "returns true if a diagonal win" do
      expect(black_diagonal.win?("black")).to eq(true)
    end

    it "returns false if no one has won" do
      expect(board.win?("red")).to eq (false)
    end
  end

  describe "#horizontal_win?" do
    it "returns true if red has won horizontally" do
      expect(red_horizontal.horizontal_win?("red")).to eq(true)
    end

    it "returns true if black has won horizontally" do
      expect(black_horizontal.horizontal_win?("black")).to eq(true)
    end

    it "returns false if no one has won horizontally" do
      expect(board.horizontal_win?("red")).to eq(false)
    end
  end

  describe "#vertical_win?" do
    it "returns true if red has won vertically" do
      expect(red_vertical.vertical_win?("red")).to eq(true)
    end

    it "returns true if black has won vertically" do
      expect(black_vertical.vertical_win?("black")).to eq(true)
    end

    it "returns false if no one has won vertically" do
      expect(board.vertical_win?("red")).to eq(false)
    end
  end

  describe "#diagonal_win?" do
    it "returns true if red has won diagonally" do
      expect(red_diagonal.diagonal_win?("red")).to eq(true)
    end
    it "returns true if black has won diagonally" do
      expect(black_diagonal.diagonal_win?("black")).to eq(true)
    end
    it "returns false if no one has won diagonally" do
      expect(board.diagonal_win?("red")).to eq(false)
    end
  end

  describe "#check_connections" do
    it "returns true if the given array contains 4 red in a row" do
      expect(board.check_connections(["R","R","R","R"], "red")).to eq(true)
    end

    it "returns true if the given array contains 4 black in a row" do
      expect(board.check_connections(["B","B","B","B"], "black")).to eq(true)
    end

    it "returns false if the given array has 4 empty spots" do
      expect(board.check_connections(["-","-","-","-"], "black")).to eq(false)
    end

    it "returns false if the given array has 3 in a row" do
      expect(board.check_connections(["R","B","B","B"], "black")).to eq(false)
    end

    it "returns false if the given array doesn't match at all" do
      expect(board.check_connections(["R","B","R","B"], "black")).to eq(false)
    end
  end
end
