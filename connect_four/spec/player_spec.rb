require 'player'

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
  describe '#winning_move' do
    expect(player.move).to be(3)

  end
end