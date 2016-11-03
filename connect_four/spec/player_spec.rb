load 'lib/player.rb'

describe 'Player' do
  let(:p){ Player.new }
  describe '#initialize' do
    it 'raises an error when arguments are passed to initialize' do
      expect do
        Board.new(1)
      end.to raise_error(ArgumentError)
    end
  end
