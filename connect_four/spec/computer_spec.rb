require_relative '../lib/deep_dup.rb'
require_relative '../lib/player.rb'
require_relative '../lib/computer.rb'

describe 'Computer' do

  let(:computer){Computer.new(Board.new, 'o')}

  describe '#initialize' do

    it 'should give you a computer' do
      expect(computer).to be_a(Computer)
    end

    it 'should not give readable access to board' do
      expect{computer.board}.to raise_error(NoMethodError)
    end

    it 'should have a readable symbol' do
      expect(computer.symbol).to eq('o')
    end

    it 'should have a name' do
      expect(computer.name).to be_a(String)
    end
  end

  describe '#get_move' do

    it 'should return true indicating that move was placed on board' do
      expect(computer.get_move).to eq(true)
    end
  end

end