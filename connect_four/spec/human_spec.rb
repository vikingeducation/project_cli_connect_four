require_relative '../lib/deep_dup.rb'
require_relative '../lib/player.rb'
require_relative '../lib/human.rb'

describe 'Human' do

  let(:board){Board.new}
  let(:human){Human.new(board, 'o', 'Name')}

  describe '#initialize' do

    it 'should give you a human' do
      expect(human).to be_a(Human)
    end

    it 'should not give readable access to board' do
      expect{human.board}.to raise_error(NoMethodError)
    end

    it 'should have a readable symbol' do
      expect(human.symbol).to eq('o')
    end

    it 'should have a name' do
      expect(human.name).to be_a(String)
      expect(human.name).to eq('Name')
    end
  end

  describe '#get_move' do

    # TODO:  I feel like this isn't good enough
    it 'should not be an endless do loop' do
      allow(human).to receive(:ask_move).and_return(4)
      expect(human.get_move).to eq(nil)
    end
  end

end