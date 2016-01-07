require 'board'
require 'rainbow'


describe Board do

  let( :board ) { Board.new }

  empty_board = [
                  [nil, nil, nil, nil, nil, nil, nil], 
                  [nil, nil, nil, nil, nil, nil, nil], 
                  [nil, nil, nil, nil, nil, nil, nil], 
                  [nil, nil, nil, nil, nil, nil, nil], 
                  [nil, nil, nil, nil, nil, nil, nil], 
                  [nil, nil, nil, nil, nil, nil, nil]
              ]

  forward_diagonal_victory = [
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, "R", nil, nil, nil],
                  [nil, nil, "R", "G", nil, nil, nil],
                  [nil, "R", "G", "G", nil, nil, nil],
                  ["R", "G", "G", "G", nil, nil, nil],
                ]

    full_board = [
                  ["G", "R", "G", "G", "G", "R", "R"],
                  ["t", "G", "G", "R", "G", "R", "R"],
                  ["G", "G", "R", "R", "G", "R", "G"],
                  ["t", "t", "R", "G", "R", "G", "G"],
                  ["R", "G", "t", "G", "R", "G", "R"],
                  ["R", "G", "G", "G", "R", "R", "G"],
                  ]

    vertical_victory = [
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, "R", nil, nil, nil],
                  [nil, nil, nil, "R", nil, nil, nil],
                  [nil, nil, nil, "R", nil, nil, nil],
                  [nil, nil, nil, "R", nil, nil, nil],
                ]

    horizontal_victory = [
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, "R", "R", "R", "R"],
                ]

    backward_diagonal victory = [
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, nil, nil, nil, nil],
                  [nil, nil, nil, "R", nil, nil, nil],
                  [nil, nil, nil, "G", "R", nil, nil],
                  [nil, nil, nil, "G", "G", "R", nil],
                  [nil, nil, nil, "G", "G", "G", "R"],
                ]


  describe '#attr_accessor' do
    it "responds to :game_board attribute" do
      expect(board).to respond_to :game_board
    end
  end


  describe "initialize" do
    it "makes an empty gameboard" do
      expect(board.game_board).to be_an_instance_of(Array)
      expect(board.check_board_empty?).to be true
    end

  end

  describe "#get_move_array" do
    it "returns coordinates of move if there is an empty slot" do
      expect(board.get_move_array(0)).to be([5, 0])
    end

    it "returns nothing if column is full" do
      expect(full_board.get_move_array(0)).to be false
    end
  end

  describe "#atleast_one_row_empty?" do
    it "returns true if at least one row is empty" do
      expect(board.atleast_one_row_empty(0)).to be true
    end

    it "returns false if all rows are full" do
      expect(full_board.atleast_one_row_empty(0)).to be false
    end
  end

  describe "#straight_win?" do
    it "returns true if there is a diagonal win" do
      expect(forward_diagonal_victory.straight_win?(forward_diagonal_victory.board, [5, 0], "R")).to be true
    end

    it "returns true if there is a horizontal win" do
      expect(horizontal_victory.straight_win?(horizontal_victory.board, [5, 4], "R")).to be true
    end

    it "returns true if there is a vertical win" do
      expect(vertical_victory.straight_win?(vertical_victory.board, [3, 3], "R")).to be true
    end

    it "returns false if there is no win" do
      expect(board.straight_win?(board.board, [0, 0], "R")).to be false
    end
  end








end