require 'player'
require 'grid'

describe Player do 

	let(:player) { Player.new('Player 1', :X, Grid.new) }

  describe '#initialize' do
    it 'should have an instance variable name set to "Player 1"' do
      expect(player.name).to eq('Player 1')
    end

    it 'should have an instance variable disc set to :X' do
      expect(player.disc).to eq(:X)
    end

    it 'should have an instance variable grid set to be a new Grid instance' do
      expect(player.grid).to be_a(Grid)	
    end
  end

  describe '#get_choice' do

    it 'should convert user input to an integer' do
      allow(player).to receive(:gets).and_return('4')
      player.get_choice
      expect(player.instance_variable_get(:@column)).to be_an(Integer)
    end

    it 'should return the user input - 1 to match array indeces' do
      allow(player).to receive(:gets).and_return('4')
      player.get_choice
      expect(player.instance_variable_get(:@column)).to eq(3)
    end

     it 'should not accept the column until it is within a valid range (1-7)' do
      allow(player).to receive(:gets).and_return('39', '3')
      player.get_choice
      expect(player.instance_variable_get(:@column)).to eq(2)
    end

  end
	
end