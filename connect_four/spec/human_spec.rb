require 'human'

describe Human do

  let(:board) do
    double('board', :add_piece_to_board => nil)
  end

  let(:human) {Human.new(board, "X")}

  describe '#initialize' do
    # Happy - all good when initialized with two arguments
    # Bad - raises ArgumentError when initialized with zero arguments
    it 'passes when run with two arguments' do
      expect{Human.new("X", "X")}.not_to raise_error
    end

    it 'raises an error when initialized with zero arguments' do
      expect{Human.new}.to raise_error(ArgumentError)
    end
  end

  describe "#turn" do
    # Expect std_output to be "1 or 2 player mode (type 1 or 2 then press enter): " when called.
    it "gets the board to call the add_piece_to_board method" do
      allow(human).to receive(:pick_a_column).and_return(3)
      expect(board).to receive(:add_piece_to_board)
      human.turn
    end
  end

  describe "#set_mode" do
    # it calls the pick_a_mode method
    it 'calls the pick_a_mode method' do
      expect(human).to receive(:pick_a_mode)
      human.set_mode
    end
  end
end