load 'lib/player.rb'

describe 'Player' do
  let(:p){ Player }

  describe '#initialize' do
  
    it 'raises an error when arguments are passed to initialize' do
      expect{Player.new}.to raise_error(ArgumentError)
    end

    it 'assigns a color upon initialization' do
      expect(p.new('blue').color).to eq('blue')
    end

    it 'assigns x if player color equals red' do
      a = p.new('red')
      expect(a.symbol).to eq('X')
    end

    it 'assigns o to any player color other than red' do
      expect(p.new('blue').symbol).to eq('O')
    end
  end
end
