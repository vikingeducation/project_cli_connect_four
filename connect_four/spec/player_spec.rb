require 'player'
require 'board'

describe Human do
  describe '#move' do
    let(:player){Human.new}
    it 'move returns decreased by 1 input' do
      allow(player).to receive(:gets).and_return("4")
      expect(player.move).to be(3)
    end
  end

end

describe AI do
  describe '#move' do
    let(:board){Board.new}
    let(:ai){AI.new(board, 1)}
    it 'AI should make a move if possible' do
      expect((ai.move <= 5) && (ai.move >= 0)).to be_truthy
    end

    it 'AI makes a winning move if possible' do
      board.move([0,1])
      board.move([0,1])
      board.move([0,1])
      expect(ai.move).to be(0)
    end

    it 'AI makes a winning move if possible' do

    end
  end
end