require 'board'
require 'rainbow'


describe Board do

  let( :board ) { Board.new }
  let( :empty_board ) { Board.new }
  let( :forward_diagonal_board ) { Board.new }
  let( :full_board ) { Board.new }
  let( :vertical_board ) { Board.new }
  let( :horizontal_board ) { Board.new }
  let( :backwards_diagonal_board ) { Board.new }

  # let( :empty_board ) { Board.new } 


  before do
    empty_board.game_board = [
                    [nil, nil, nil, nil, nil, nil, nil], 
                    [nil, nil, nil, nil, nil, nil, nil], 
                    [nil, nil, nil, nil, nil, nil, nil], 
                    [nil, nil, nil, nil, nil, nil, nil], 
                    [nil, nil, nil, nil, nil, nil, nil], 
                    [nil, nil, nil, nil, nil, nil, nil]
                ] 

    forward_diagonal_board.game_board = [
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "R", nil, nil, nil],
                    [nil, nil, "R", "G", nil, nil, nil],
                    [nil, "R", "G", "G", nil, nil, nil],
                    ["R", "G", "G", "G", nil, nil, nil],
                  ]

      full_board.game_board = [
                    ["G", "R", "G", "G", "G", "R", "R"],
                    ["t", "G", "G", "R", "G", "R", "R"],
                    ["G", "G", "R", "R", "G", "R", "G"],
                    ["t", "t", "R", "G", "R", "G", "G"],
                    ["R", "G", "t", "G", "R", "G", "R"],
                    ["R", "G", "G", "G", "R", "R", "G"],
                    ]

      vertical_board.game_board = [
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "R", nil, nil, nil],
                    [nil, nil, nil, "R", nil, nil, nil],
                    [nil, nil, nil, "R", nil, nil, nil],
                    [nil, nil, nil, "R", nil, nil, nil],
                  ]

      horizontal_board.game_board = [
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "R", "R", "R", "R"],
                  ]

      backwards_diagonal_board.game_board = [
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, nil, nil, nil, nil],
                    [nil, nil, nil, "R", nil, nil, nil],
                    [nil, nil, nil, "G", "R", nil, nil],
                    [nil, nil, nil, "G", "G", "R", nil],
                    [nil, nil, nil, "G", "G", "G", "R"],
                  ]
  end


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
      expect(board.get_move_array(0)).to eq([5, 0])
    end

    it "returns nothing if column is full" do
      expect(full_board.get_move_array(0)).to be false
    end
  end

  describe "#atleast_one_row_empty?" do
    it "returns true if at least one row is empty" do
      expect(board.atleast_one_row_empty?(0)).to be true
    end

    it "returns false if all rows are full" do
      expect(full_board.atleast_one_row_empty?(0)).to be false
    end
  end

  describe "#straight_win?" do
    it "returns true if there is a diagonal win" do
      expect(forward_diagonal_board.straight_win?(forward_diagonal_board.game_board, [5, 0], "R")).to be true
    end

    it "returns true if there is a horizontal win" do
      expect(horizontal_board.straight_win?(horizontal_board.game_board, [5, 4], "R")).to be true
    end

    it "returns true if there is a vertical win" do
      expect(vertical_board.straight_win?(vertical_board.game_board, [3, 3], "R")).to be true
    end

    it "returns false if there is no win" do
      expect(board.straight_win?(board.game_board, [0, 0], "R")).to be nil
    end
  end


  describe '#check_board_full?' do
    it "returns true if the board is full" do
      expect(full_board.check_board_full?).to be true
    end

    it "returns false if the board is not full" do
      expect(horizontal_board.check_board_full?).to be false
    end
  end

  describe '#check_diagonals' do
    it "returns true if forward diagonal victory" do
      expect(forward_diagonal_board.check_diagonals(Board::FORWARD_DIAGONALS, forward_diagonal_board.game_board, "R", [4,1])).to be true

    end


  end







end