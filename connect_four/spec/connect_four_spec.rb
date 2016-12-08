require 'board.rb'
require 'computer_player'
require 'connect_four'
require 'human_player'
require 'peg_system_test'

describe Board  do
  let(:board){Board.new}

# describe "#render" do
# - does it print what i want
# end

describe "is_board_full?" do
  it "returns true if board is full" do
    board = [["@", "@", "O", "O", "O", "@", "@"],
            ["O", "O", "O", "@", "@", "@", "@"],
            ["O", "@", "@", "@", "O", "O", "O"],
            ["@", "O", "O", "O", "@", "@", "@"],
            ["@", "@", "O", "O", "O", "@", "@"],
            ["@", "O", "O", "O", "@", "@", "@"]]
    expect(Board.new(board).is_board_full?).to be_truthy
  end

  it "returns false when has only one spot empty" do
    board = [["@", "@", "O", nil, "O", "@", "@"],
            ["O", "O", "O", "@", "@", "@", "@"],
            ["O", "@", "@", "@", "O", "O", "O"],
            ["@", "O", "O", "O", "@", "@", "@"],
            ["@", "@", "O", "O", "O", "@", "@"],
            ["@", "O", "O", "O", "@", "@", "@"]]
    expect(Board.new(board).is_board_full?).to be_falsey
  end

  it "returns false when whole board is empty" do
    board = [[nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil]]
    expect(Board.new(board).is_board_full?).to be_falsey
  end

  it "returns false when half board is empty" do
    board = [[nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil],
             ["@", "O", "O", "O", "@", "@", "@"],
             ["@", "@", "O", "O", "O", "@", "@"],
             ["@", "O", "O", "O", "@", "@", "@"]]
    expect(Board.new(board).is_board_full?).to be_falsey
  end

end


describe "#add_pegs" do
  it "adds peg in column in next available slot when the board is empty" do
    board = Board.new
    board.add_pegs(1,"@")
    board_added_peg = [[nil, nil, nil, nil, nil, nil, nil],
                       [nil, nil, nil, nil, nil, nil, nil],
                       [nil, nil, nil, nil, nil, nil, nil],
                       [nil, nil, nil, nil, nil, nil, nil],
                       [nil, nil, nil, nil, nil, nil, nil],
                       ["@", nil, nil, nil, nil, nil, nil]]
    expect(board.board).to eq(board_added_peg)
  end

  it "adds peg in column in next available slot when board is half empty" do
    board_test = [[nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil],
             ["@", "O", "O", "O", "@", "@", "@"],
             ["@", "@", "O", "O", "O", "@", "@"],
             ["@", "O", "O", "O", "@", "@", "@"]]
    board = Board.new(board_test)
    board.add_pegs(5, "@")
    board_added_peg = [[nil, nil, nil, nil, nil, nil, nil],
                       [nil, nil, nil, nil, nil, nil, nil],
                       [nil, nil, nil, nil, "@", nil, nil],
                       ["@", "O", "O", "O", "@", "@", "@"],
                       ["@", "@", "O", "O", "O", "@", "@"],
                       ["@", "O", "O", "O", "@", "@", "@"]]
    expect(board.board).to eq(board_added_peg)
  end

  it "adds peg in column in next available slot when board has one slot" do
    board_test = [["@", "@", "O", nil, "O", "@", "@"],
              ["O", "O", "O", "@", "@", "@", "@"],
              ["O", "@", "@", "@", "O", "O", "O"],
              ["@", "O", "O", "O", "@", "@", "@"],
              ["@", "@", "O", "O", "O", "@", "@"],
              ["@", "O", "O", "O", "@", "@", "@"]]
    board = Board.new(board_test)
    board.add_pegs(4, "O")
    board_added_peg = [["@", "@", "O", "O", "O", "@", "@"],
                        ["O", "O", "O", "@", "@", "@", "@"],
                        ["O", "@", "@", "@", "O", "O", "O"],
                        ["@", "O", "O", "O", "@", "@", "@"],
                        ["@", "@", "O", "O", "O", "@", "@"],
                        ["@", "O", "O", "O", "@", "@", "@"]]
    expect(board.board).to eq(board_added_peg)
  end

end

describe "#slot_empty?" do
  it "return true is the coordinates are free to use" do
    board = Board.new
    expect(board.slot_empty?(3, 4)).to be_truthy
  end

  it "return false when the coordinates are taken by a peg" do
    board_test = [[nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil],
             [nil, nil, nil, nil, nil, nil, nil],
             ["@", "O", "O", "O", "@", "@", "@"],
             ["@", "@", "O", "O", "O", "@", "@"],
             ["@", "O", "O", "O", "@", "@", "@"]]
    board = Board.new(board_test)
    expect(board.slot_empty?(3, 3)).to be_falsey
  end

  it "return true when the coordinates are free to use and it's the only empty spot on the board"  do
    board_test = [["@", "@", "O", nil, "O", "@", "@"],
                  ["O", "O", "O", "@", "@", "@", "@"],
                  ["O", "@", "@", "@", "O", "O", "O"],
                  ["@", "O", "O", "O", "@", "@", "@"],
                  ["@", "@", "O", "O", "O", "@", "@"],
                  ["@", "O", "O", "O", "@", "@", "@"]]
    board = Board.new(board_test)
    expect(board.slot_empty?(0, 4)).to be_truthy
  end

end

describe "can_drop_peg_here?" do
  it "returns true if a peg can be dropped to the given empty column" do
    board = Board.new
    expect(board.can_drop_peg_here?(1)).to be_truthy
  end

  it "returns true if a peg can be dropped to the given empty column" do
    board = Board.new
    expect(board.can_drop_peg_here?(1)).to be_truthy
  end


  it "returns false if a peg cannot be dropped to a full column" do
    board_test = [["@", "@", "O", nil, "O", "@", "@"],
                  ["O", "O", "O", "@", "@", "@", "@"],
                  ["O", "@", "@", "@", "O", "O", "O"],
                  ["@", "O", "O", "O", "@", "@", "@"],
                  ["@", "@", "O", "O", "O", "@", "@"],
                  ["@", "O", "O", "O", "@", "@", "@"]]
    board = Board.new(board_test)
    expect(board.can_drop_peg_here?(2)).to be_falsey
  end

  it "returns true if a peg can be dropped to a column with only one space" do
    board_test = [["@", "@", "O", nil, "O", "@", nil],
                  ["O", "O", "O", "@", "@", "@", "@"],
                  ["O", "@", "@", "@", "O", "O", "O"],
                  ["@", "O", "O", "O", "@", "@", "@"],
                  ["@", "@", "O", "O", "O", "@", "@"],
                  ["@", "O", "O", "O", "@", "@", "@"]]
    board = Board.new(board_test)
    expect(board.can_drop_peg_here?(7)).to be_truthy
  end
end

  describe "#is_valid_input?" do
    it "returns true when input is correct" do
      expect(board.is_valid_input?(4)).to be_truthy
    end

    it "returns false when input is out of range" do
      expect(board.is_valid_input?(9)).to be_falsey
    end

    it "returns false when input is not integer" do
      input = "a".to_i
      expect(board.is_valid_input?(input)).to be_falsey
    end

  end

  describe "#within_board_range?" do
    it "returns true when coordinates are on the board" do
      expect(board.within_board_range?(4,3)).to be_truthy
    end

    it "returns false when coordinates are not on the board (row is, column not)" do
      expect(board.within_board_range?(1,8)).to be_falsey
    end

    it "returns false when coordinates are on the board (column is, row not)" do
      expect(board.within_board_range?(7,1)).to be_falsey
    end

    it "returns false when coordinates are on the board (both)" do
      expect(board.within_board_range?(9,9)).to be_falsey
    end

  end

# describe "does it accept only 6 by 7 array?" do
#   it "raise error when we pass string instead of array"
#     board = Board.new{Array.new(6){Array.new(3)}}
#     expect {board.board.size != 6 && board.board[0].size != 7}.to raise_error("Array has to be 2D = 6 by 7")
#   end

#   it "returns false when we passing Integer to the board, not Array" do
#     board = Board.new(123)
#     expect {board.board}.to raise_error("Board has to be an Array")
#   end

# end

end

describe ComputerPlayer do
  let(:board) {Board.new}
  let(:ai_pegs) {PegSystem.new("O", :board)}
  let(:human_pegs) {PegSystem.new("@", :board)}
  let(:ai_player) {ComputerPlayer.new("AI_Test", "O", :board, :human_pegs, :ai_pegs)}

context "#get_col_guessed" do
  describe "Can AI add his peg in order to connect remaining three vertically" do
    it "returns true when AI adds to others on the side of the board " do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil],
                   ["O", "O", nil, nil, "@", nil, nil],
                   ["O", "@", "O", "O", "O", "@", "@"],
                   ["O", "O", "O", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil],
                   ["O", nil, nil, nil, nil, nil, nil],
                   ["O", "O", nil, nil, "@", nil, nil],
                   ["O", "@", "O", "O", "O", "@", "@"],
                   ["O", "O", "O", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end

    it "returns true when AI adds to others on the middle level of the board " do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                   ["O", nil, nil, nil, nil, nil, nil],
                   ["O", nil, nil, nil, nil, nil, nil],
                   ["O", "O", nil, nil, "@", nil, nil],
                   ["@", "@", "O", "O", "O", "@", "@"],
                   ["@", "O", "O", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [["O", nil, nil, nil, nil, nil, nil],
                   ["O", nil, nil, nil, nil, nil, nil],
                   ["O", nil, nil, nil, nil, nil, nil],
                   ["O", "O", nil, nil, "@", nil, nil],
                   ["@", "@", "O", "O", "O", "@", "@"],
                   ["@", "O", "O", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end
  end

  describe "Can AI add his peg in order to connect remaining three horizontally" do
    it "returns true when AI adds to others on the middle level of the board" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", nil, nil, nil, nil, nil, nil],
                    ["O", "O", nil, nil, nil, nil, nil],
                    ["@", "@", "O", "O", nil, "@", "@"],
                    ["@", "O", "O", "O", nil, "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", nil, nil, nil, nil, nil, nil],
                    ["O", "O", nil, nil, nil, nil, nil],
                    ["@", "@", "O", "O", nil, "@", "@"],
                    ["@", "O", "O", "O", "O", "@", "@"]]
      expect(board.board).to eq(board_end)
    end

    it "returns true when AI adds to others on the top level of the board" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", "@", "O", "O", "O", nil, nil],
                    ["O", "O", "@", "@", "@", "O", "O"],
                    ["@", "@", "O", "O", nil, "@", "@"],
                    ["@", "O", "O", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  ["@", "@", "O", "O", "O", "O", nil],
                  ["O", "O", "@", "@", "@", "O", "O"],
                  ["@", "@", "O", "O", nil, "@", "@"],
                  ["@", "O", "O", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end

    it "returns true when AI doesn't add fourth peg to connected three due to extra space below the level" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", "@", nil, nil, nil, nil, nil],
                    ["@", "@", "O", "O", "O", nil, "@"],
                    ["O", "O", "@", "O", "@", nil, nil],
                    ["@", "@", "O", "@", "O", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", "@", nil, nil, nil, nil, nil],
                    ["@", "@", "O", "O", "O", nil, "@"],
                    ["O", "O", "@", "O", "@", "O", nil],
                    ["@", "@", "O", "@", "O", "@", "@"]]
      expect(board.board).not_to eq(board_end)
    end
  end

  describe "Can AI add his peg in order to connect remaining three north east diagonally" do
    it "returns true when AI adds to others on bottom part of the board" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", "@", "O", "O", "@", nil, nil],
                    ["O", "O", "@", "@", "O", "O", "O"],
                    ["@", "@", "O", "O", nil, "@", "@"],
                    ["@", "O", "O", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", "@", "O", "O", "@", "O", nil],
                    ["O", "O", "@", "@", "O", "O", "O"],
                    ["@", "@", "O", "O", nil, "@", "@"],
                    ["@", "O", "O", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end


    it "returns true when AI adds 3rd peg in between two pegs connected and 4th on the other side" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", "@", "@", "O", nil, "O", nil],
                    ["O", "O", "O", "@", nil, "@", "O"],
                    ["@", "@", "O", "O", "@", "@", "@"],
                    ["@", "O", "O", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", "@", "@", "O", nil, "O", nil],
                    ["O", "O", "O", "@", "O", "@", "O"],
                    ["@", "@", "O", "O", "@", "@", "@"],
                    ["@", "O", "O", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end

    it "returns true when AI adds to others on the middle level of the board" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, "O", "@", nil, nil, nil],
                    ["@", "O", "O", "O", "@", nil, nil],
                    ["O", "O", "@", "@", "O", "O", "O"],
                    ["@", "@", "O", "O", "@", "@", "@"],
                    ["@", "O", "@", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, "O", nil, nil, nil],
                    [nil, nil, "O", "@", nil, nil, nil],
                    ["@", "O", "O", "O", "@", nil, nil],
                    ["O", "O", "@", "@", "O", "O", "O"],
                    ["@", "@", "O", "O", "@", "@", "@"],
                    ["@", "O", "@", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end
  end

  describe "Can AI add his peg in order to connect remaining three south east diagonally" do
    it "returns true when AI adds to others on the bottom level of the board" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "@", nil, nil, nil],
                    ["@", nil, nil, "O", nil, nil, nil],
                    ["O", nil, nil, "@", "O", nil, nil],
                    ["@", "@", nil, "O", "@", "O", nil],
                    ["@", "O", "@", "O", "@", "@", nil]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "@", nil, nil, nil],
                    ["@", nil, nil, "O", nil, nil, nil],
                    ["O", nil, nil, "@", "O", nil, nil],
                    ["@", "@", nil, "O", "@", "O", nil],
                    ["@", "O", "@", "O", "@", "@", "O"]]
      expect(board.board).to eq(board_end)
    end

    it "returns true when AI adds to others on the middle level of the board - filling space between two and one of his pegs" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "@", nil, nil, nil],
                    ["O", nil, nil, "O", nil, nil, nil],
                    ["O", nil, nil, "@", "O", nil, nil],
                    ["@", "@", "O", "O", "@", "O", nil],
                    ["@", "O", "@", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "@", nil, nil, nil],
                    ["O", nil, nil, "O", nil, nil, nil],
                    ["O", "O", nil, "@", "O", nil, nil],
                    ["@", "@", "O", "O", "@", "O", nil],
                    ["@", "O", "@", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end
  end


# =============== OPPONENTS PEGS ++++++++======================
  describe "Can AI add his peg in order to block opponent's three from winning - vertically" do
    it "returns true when AI blocks opponent on the side of the board " do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil],
                   ["@", "O", nil, nil, "@", nil, nil],
                   ["@", "@", "O", "O", "O", "@", "@"],
                   ["@", "O", "O", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil],
                   ["O", nil, nil, nil, nil, nil, nil],
                   ["@", "O", nil, nil, "@", nil, nil],
                   ["@", "@", "O", "O", "O", "@", "@"],
                   ["@", "O", "O", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end

    it "returns true when AI blocks opponent on the middle level of the board " do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                   ["O", nil, nil, "@", nil, nil, nil],
                   ["@", nil, nil, "@", nil, nil, nil],
                   ["@", "O", nil, "@", "@", nil, nil],
                   ["O", "@", "O", "O", "O", "@", "@"],
                   ["O", "@", "O", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, "O", nil, nil, nil],
                   ["O", nil, nil, "@", nil, nil, nil],
                   ["@", nil, nil, "@", nil, nil, nil],
                   ["@", "O", nil, "@", "@", nil, nil],
                   ["O", "@", "O", "O", "O", "@", "@"],
                   ["O", "@", "O", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end
  end

  describe "Can AI add his peg in order to block opponent's three from winning - horizontally" do
    it "returns true when AI blocks opponent on the middle level of the board" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["O", nil, nil, nil, nil, nil, nil],
                    ["@", "@", "@", nil, nil, nil, nil],
                    ["@", "@", "O", "O", nil, "@", "@"],
                    ["@", "O", "O", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["O", nil, nil, nil, nil, nil, nil],
                    ["@", "@", "@", "O", nil, nil, nil],
                    ["@", "@", "O", "O", nil, "@", "@"],
                    ["@", "O", "O", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end
# BUG HERE
    it "returns true when AI blocks opponent on the top level of the board" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, "@", "@", "@", nil, nil],
                    ["@", "@", "O", "O", "@", nil, "@"],
                    ["O", "O", "@", "@", "O", "O", "O"],
                    ["@", "@", "O", "O", "O", "@", "@"],
                    ["@", "O", "@", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, "O", "@", "@", "@", nil, nil],
                    ["@", "@", "O", "O", "@", nil, "@"],
                    ["O", "O", "@", "@", "O", "O", "O"],
                    ["@", "@", "O", "O", "O", "@", "@"],
                    ["@", "O", "@", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end
  end

  describe "Can AI add his peg in order to block opponent's three from winning - north east diagonally" do
    it "returns true when AI blocks opponent on bottom part of the board" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", "@", "O", "O", "@", nil, nil],
                    ["O", "O", "@", "@", "O", "O", "O"],
                    ["@", "@", "O", "O", nil, "@", "@"],
                    ["@", "O", "O", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    ["@", "@", "O", "O", "@", "O", nil],
                    ["O", "O", "@", "@", "O", "O", "O"],
                    ["@", "@", "O", "O", nil, "@", "@"],
                    ["@", "O", "O", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end

    it "returns true when AI blocks opponent on the middle level of the board" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, "O", "@", nil, nil, nil],
                    ["@", "O", "O", "O", "@", nil, nil],
                    ["O", "O", "@", "@", "O", "O", "O"],
                    ["@", "@", "O", "O", "@", "@", "@"],
                    ["@", "O", "@", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, "O", nil, nil, nil],
                    [nil, nil, "O", "@", nil, nil, nil],
                    ["@", "O", "O", "O", "@", nil, nil],
                    ["O", "O", "@", "@", "O", "O", "O"],
                    ["@", "@", "O", "O", "@", "@", "@"],
                    ["@", "O", "@", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end
  end

  describe "Can AI add his peg in order to block opponent's three from winning - south east diagonally" do
    it "returns true when AI blocks opponent on the bottom level of the board" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "@", nil, nil, nil],
                    ["@", nil, nil, "O", nil, nil, nil],
                    ["O", nil, nil, "@", "O", nil, nil],
                    ["@", "@", nil, "O", "@", "O", nil],
                    ["@", "O", "@", "O", "@", "@", nil]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "@", nil, nil, nil],
                    ["@", nil, nil, "O", nil, nil, nil],
                    ["O", nil, nil, "@", "O", nil, nil],
                    ["@", "@", nil, "O", "@", "O", nil],
                    ["@", "O", "@", "O", "@", "@", "O"]]
      expect(board.board).to eq(board_end)
    end

    it "returns true when AI blocks opponent on the middle level of the board - filling space between two and one of his pegs" do
      board_test = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "@", nil, nil, nil],
                    ["O", nil, nil, "O", nil, nil, nil],
                    ["O", nil, nil, "@", "O", nil, nil],
                    ["@", "@", "O", "O", "@", "O", nil],
                    ["@", "O", "@", "O", "@", "@", "@"]]
      board = Board.new(board_test)
      human_pegs = PegSystem.new("@", board)
      ai_pegs = PegSystem.new("O", board)
      ai_player = ComputerPlayer.new("AI_Test", "O", board, human_pegs, ai_pegs)
      ai_player.get_col_guessed
      board_end = [[nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "@", nil, nil, nil],
                    ["O", nil, nil, "O", nil, nil, nil],
                    ["O", "O", nil, "@", "O", nil, nil],
                    ["@", "@", "O", "O", "@", "O", nil],
                    ["@", "O", "@", "O", "@", "@", "@"]]
      expect(board.board).to eq(board_end)
    end
  end

end
end



# board
# peg_system_competitor
# peg_system_computer


# HUMAN PLAYER-------------------------------------------------
describe HumanPlayer do
  let(:board) {Board.new}
  let(:player) {HumanPlayer.new("Human", "@", board)}

  describe "#get_col_guessed" do
    it "users input updates the board with adequate peg inserted" do
      allow(player).to receive(:gets).and_return("2")
      board_act_1 = [[nil, nil, nil, nil, nil, nil, nil],
                     [nil, nil, nil, nil, nil, nil, nil],
                     [nil, nil, nil, nil, nil, nil, nil],
                     [nil, nil, nil, nil, nil, nil, nil],
                     [nil, nil, nil, nil, nil, nil, nil],
                     [nil, "@", nil, nil, nil, nil, nil]]
      player.get_col_guessed(2)
      expect(board.board).to eq(board_act_1)
    end
  end

  describe "#initialize" do
    it "raises an error when the peg is not a string" do
      expect{HumanPlayer.new("Human", 23, @board)}.to raise_error("Peg has to be a string")
    end
  end
end



# peg_symbol
# - returns ArgumentError if the name is not a string


# get_col_guessed
# - returns column that was input by the player
# - does it update the board with the guess?
# - does it notify when incorrect column is provided

# ask_for_col_guessed
#  - asks for inout

# CONNECT FOUR----------------------------------------------------

# @board
# play
# - returns display and asking for input?
# - returns AI as player two if it's chosen
# - returns another human a player two if it's chosen
# - returns the board before the game starts
# - asks player for input between turns
# - end the game if game is over
# - continues the game it's nt over
# - holds new player after a turn
# - holds new peg system after a turn
# - renders final board






# -----private------
# welcome_display
# - returns required display for start the game

# against_player_or_computer?
# - does it ask for input?
# - returns current player computer if such is chosen and peg system
# - returns human player if it's chosen and peg system
# - prompts if incorrect value was chosen

# ask_for_player_or_computer
# - does it prompt for user inupt
# - does it display instructions

# is_there_winner?
# - is there winner if the board holds four pegs connected  of player one?
# - - is there winner if the board holds four pegs connected  of player two?
# - does it display aquired message?

# is_there_draw?
# - returns true if the board is full?
# - returns false if the board is not full
# - does it display relevant message?

# game_over
# - does it notify about a draw?
# - does it notify about a wining
# - does it return false if there is no draw or inner?

# switch_players
# - does it swicth player into two whne we have number one?
# - does he swith to player two if one was

# switch_peg_system
# - does it switch into one when current is two?
# - does it switch into two if one is current?


# PEG SYSTEM---------------------------------------------------------

describe PegSystem do
  describe "#four_pegs_horizontally" do
    it "returns true when board contains four pegs connected horizontally" do
      board_new = [[nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil],
                   ["O", nil, nil, nil, nil, nil, nil],
                   ["O", "O", nil, nil, "@", nil, nil],
                   ["@", "O", "O", "O", "O", "@", "@"],
                   ["@", "O", "O", "O", "@", "@", "@"]]
      board = Board.new(board_new)
      ai_pegs = PegSystem.new("O", board)
      # pegsystem.instance_variable_set(:@board, board_new)
      expect(ai_pegs.four_pegs_horizontally?).to be_truthy
    end
  end

  describe "#four_pegs_horizontally" do
    it "returns false when board doesn't contain four pegs connected horizontally" do
      board_new = [[nil, nil, nil, nil, nil, nil, nil],
                   [nil, nil, nil, nil, nil, nil, nil],
                   ["O", nil, nil, nil, nil, nil, nil],
                   ["O", "O", nil, nil, "@", nil, nil],
                   ["@", "O", "@", "O", "O", "@", "@"],
                   ["@", "O", "O", "O", "@", "@", "@"]]
      board = Board.new(board_new)
      ai_pegs = PegSystem.new("O", board)
      # pegsystem.instance_variable_set(:@board, board_new)
      expect(ai_pegs.four_pegs_horizontally?).to be_falsey
    end
  end

  # describe "#four_pegs_vertically" do
  #   it "returns true when board contains four pegs connected horizontally" do
  #     board_new = [[nil, nil, nil, nil, nil, nil, nil],
  #                  [nil, nil, nil, nil, nil, nil, nil],
  #                  ["O", nil, nil, nil, nil, nil, nil],
  #                  ["O", "O", nil, nil, "@", nil, nil],
  #                  ["O", "O", "O", "O", "O", "@", "@"],
  #                  ["@", "O", "O", "O", "@", "@", "@"]]
  #     board = Board.new(board_new)
  #     ai_pegs = PegSystem.new("O", board)
  #     # pegsystem.instance_variable_set(:@board, board_new)
  #     expect(ai_pegs.four_pegs_vertically?).to be_truthy
  #   end
  # end

  # describe "#four_pegs_vertically" do
  #   it "returns false when board doesn't contain four pegs connected horizontally" do
  #     board_new = [[nil, nil, nil, nil, nil, nil, nil],
  #                  [nil, nil, nil, nil, nil, nil, nil],
  #                  ["O", nil, nil, nil, nil, nil, nil],
  #                  ["O", "O", nil, nil, "@", nil, nil],
  #                  ["@", "O", "@", "O", "O", "@", "@"],
  #                  ["@", "O", "O", "O", "@", "@", "@"]]
  #     board = Board.new(board_new)
  #     ai_pegs = PegSystem.new("O", board)
  #     # pegsystem.instance_variable_set(:@board, board_new)
  #     expect(ai_pegs.four_pegs_vertically?).to be_falsey
  #   end
  # end

end
# peg_symbol, 
# board
# @peg_peg_peg_peg
# @peg_peg_peg_empty
# @peg_peg_empty_peg 
# @peg_empty_peg_peg
# @empty_peg_peg_peg

# four_pegs_vertically?
# - returns trou if there are 4 pegs connected on the bottom
# - returns true if we have 4 pegs connected on the top of the board

# four_pegs_horizontally?
# - - returns trou if there are 4 pegs connected on the bottom
# - returns true if we have 4 pegs connected on the top of the 

# four_pegs_diagonally?
# - returns trou if there are 4 pegs connected up on the bottom
# - returns true if we have 4 pegs connected up on the top of the 
# - returns trou if there are 4 pegs connected down on the bottom
# - returns true if we have 4 pegs connected down on the top of the 

# three_pegs_vertically?
# - returns no of column with missing 4th peg on the bottom vertically
# - returns no of column twith missing 4th peg on the top vertically
# - return false if column is full

# three_pegs_horizontally?
# - returns no of column with missing 4th peg on the bottom horizontally
# - returns no of column with missing 4th peg on the top horizontally - inside
# - returns no of column with missing 4th peg on the top horizontally - outside
# - return false if there is no 3 pegs connected
# - return false if there are 3 pegs connected with no empty around to connect them

# three_pegs_diagonally?
# - - returns no of column with missing 4th peg to make it diagonal up
# - returns no of column with missing 4th peg to make it diagonall dawn
# - returns no of column with missing 4th peg in between to make it diagonall downn
# - returns no of column with missing 4th peg in between to make it diagonall up

# winning_connected_four
# - retirns true if 4pegs horizontal?
# - returns true if 4 pegs vertical?
# - returns true if diagonal?
# - returns false if no connection
# - returns false if no winner?


# --------private----------
# south_east_diagonals_array
# - returns array of diagonals south

# north_east_diagonals_array
# - returns array of diagonals north

# space_under_slot?(coord)
# - returns true if coordinates have ampty slot
# - returns false if coordinates has full slot

# detect_pattern_in_array(array, combination)
# - returns first coord of combination included in array
# - returns nil if combination is not found in the array

# board_rotated_90deg
# - returns rotated board

# shift_se_diagonal_to_get_board_coord(row_idx)
# - returns expected coordinates

# three_pegs_south_east_diagonally?
# - returns column number with epmty slot to connect 3 other eg - in between
# - returns column number with epmty slot to connect 3 other eg - on the outside
# - with diagonall from the middle
# - with smallest diagonal


# shift_ne_diagonal_to_get_board_coord(row_idx)
# - returns expected coordinates

# three_pegs_north_east_diagonally?
# - returns column number with epmty slot to connect 3 other eg - in between
# - returns column number with epmty slot to connect 3 other eg - on the outside
# - with diagonall from the middle
# - with smallest diagonal

# diagonal_conditions(calibrator,row,x,y)
# - returns translated coordinates from diagonal array to location on the board
# - returns translated coordinates from diagonal array to location on the board
# - returns translated coordinates from diagonal array to location on the board
# - returns translated coordinates from diagonal array to location on the board
