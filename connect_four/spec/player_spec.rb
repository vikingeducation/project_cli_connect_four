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
    let(:board_ai){Board.new}
    let(:ai){AI.new(board_ai, 1)}
    let(:board_ai2){Board.new}
    let(:ai2){AI.new(board_ai2, 1)}
    it 'AI should make a move if possible' do
      expect((ai.move <= 5) && (ai.move >= 0)).to be_truthy
    end

    it 'AI makes a winning move if possible' do
      board_ai.move([5,1])
      board_ai.move([5,1])
      board_ai.move([5,1])
      expect(ai.move).to be(5)
    end

    it 'AI makes a blocking move if possible' do
      
      board_ai2.move([5,0])
      board_ai2.move([5,0])
      board_ai2.move([5,0])
      expect(ai2.move).to be(5)
    end
  end
end