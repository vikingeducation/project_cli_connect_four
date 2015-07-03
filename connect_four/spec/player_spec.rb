require 'player'
require 'board'

describe Human do
  describe '#move' do
    let(:player){Human.new}
    it 'gets human input and decrements by 1' do
      allow(player).to receive(:gets).and_return("4")
      expect(player.move).to be(3)
    end
  end
end

describe AI do
  let(:board){Board.new}
  let(:ai){AI.new(board, 1)}
  describe '#move' do
    specify 'AI should make a move if possible' do
      expect((ai.move <= 5) && (ai.move >= 0)).to be_truthy
    end

    it 'AI makes a winning move if possible' do
      3.times do
        board.move([0,1])
      end
      expect(ai.move).to be(0)
    end

    it 'AI makes a blocking move if possible' do
      3.times do
        board.move([5,0])
      end
      expect(ai.move).to be(5)
    end
  end
end