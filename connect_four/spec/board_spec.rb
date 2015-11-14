require_relative '../lib/board.rb'

describe 'Board' do

  let(:board){Board.new}

  describe '#initialize' do

    it 'should give you a board' do
      expect(board).to be_a(Board)
    end

    it 'should have an empty hash of moves' do
      expect(board.columns).to eq({0 => [], 1 => [], 2 => [], 3 => [], 4 => [],5 => [], 6 => []})
    end
  end

end