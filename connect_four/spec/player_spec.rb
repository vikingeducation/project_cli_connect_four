load 'lib/player.rb'

describe 'Player' do
  let(:p){ Player.new }
  describe '#initialize' do
    it 'raises an error when arguments are passed to initialize' do
      expect{Player.new}.to raise_error(ArgumentError)
    end
  end
end
