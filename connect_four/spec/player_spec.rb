require_relative '../lib/player.rb'

describe 'Player' do

  let(:player){Player.new(Board.new, 'o')}

  describe '#initialize' do

    it 'should give you a player' do
      expect(player).to be_a(Player)
    end

    it 'should not give readable access to board' do
      expect{player.board}.to raise_error(NoMethodError)
    end

    it 'should have a readable symbol' do
      expect(player.symbol).to eq('o')
    end

  end

end