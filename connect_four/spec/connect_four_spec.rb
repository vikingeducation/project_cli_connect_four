require 'connect_four'

describe ConnectFour do
	
  let(:game) { ConnectFour.new }

  describe '#initialize' do
    
    it 'creates a new grid' do
      expect(game.instance_variable_get(:grid)).to be_a(Grid)
    end

  end

end