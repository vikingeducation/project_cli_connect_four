require 'board'
require 'player'
require 'human'

describe Human do
  let(:human) { Human.new('r') }
  let(:board) { Board.new }
  let(:board_grid) { board.instance_variable_get( :@board ) }     
  let!(:initial_length) { board_grid.first.length }

  describe "#assign_move" do
    it "adds a piece to the board" do
      allow(human).to receive(:gets).and_return("1")
      human.assign_move(board)
      expect(board_grid.first.length).to eq(initial_length + 1)
    end

    it "does not change board if piece is not valid" do
      initial_board_grid = board_grid
      allow(human).to receive(:gets).and_return("8")
      human.assign_move(board)
      expect(board_grid).to eq(initial_board_grid)
    end
  end

  describe "#valid_entry?" do
    it "returns false if the player input for a move is invalid" do
      expect(human.valid_entry?(7)).to eq(false)
    end

    it "returns true when the player input for a move is valid" do
      expect(human.valid_entry?(4)).to eq(true)
    end
  end

end