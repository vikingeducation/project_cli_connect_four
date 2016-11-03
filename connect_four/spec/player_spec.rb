load 'lib/player.rb'

describe 'Player' do
  let(:player_red){ Player.new('red') }
  let(:player_blue){ Player.new('blue') }

  describe '#initialize' do

    it 'raises an error when arguments are passed to initialize' do
      expect{Player.new}.to raise_error(ArgumentError)
    end

    it 'assigns a color upon initialization' do
      expect(player_blue.color).to eq('blue')
    end

    it 'assigns x if player color equals red' do
      expect(player_red.symbol).to eq('X')
    end

    it 'assigns o to any player color other than red' do
      expect(player_blue.symbol).to eq('O')
    end

  end

  describe '#input' do
    let(:player){Player.new('red')}

    it 'returns response when valid response is given' do
      allow(player).to receive(:gets).and_return("1")
      expect(player.input).to eq(1)
    end

  end
end
