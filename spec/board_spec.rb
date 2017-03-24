require 'board'

describe Board do

  let(:board){ Board.new}

  describe '#initialize' do
    it 'should give you a Board' do
      expect(board).to be_a(Board)
    end
  end

  # describe '#render' do
  #   it 'should render the column names' do
  #     new_board = [ ["1", "2", "3", "4", "5", "6", "7"],
  #                             ["_", "_", "_", "_", "_", "_", "_"],
  #                             ["_", "_", "_", "_", "_", "_", "_"],
  #                             ["_", "_", "_", "_", "_", "_", "_"],
  #                             ["_", "_", "_", "_", "_", "_", "_"],
  #                             ["_", "_", "_", "_", "_", "_", "_"],
  #                             ["_", "_", "_", "_", "_", "_", "_"] ]
  #     board.instance_variable_set(:@board_state, new_board)
  #     expect(board.board_state).to eq(new_board)
  #   end
  # end

  # describe '#add_token' do
  #   it 'should add token to board' do
  #     expect(board.add_token).to eq("2, 3")
  #   end
  # end
  #
end
