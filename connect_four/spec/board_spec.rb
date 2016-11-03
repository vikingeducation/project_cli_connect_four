require_relative 'board'

describe Board do

  let(:board){ Board.new}

  describe '#initialize' do

    it 'should give you a Board' do
      expect(board).to be_a(Board)
    end
  end
end
