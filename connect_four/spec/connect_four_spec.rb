require 'connect_four'

describe ConnectFour do
	
  let(:game) { ConnectFour.new }

  describe '#initialize' do
    
    it 'creates a new grid' do
      expect(game.instance_variable_get(:@grid)).to be_a(Grid)
    end

    it 'creates two players' do
      expect(game.instance_variable_get(:@player_1)).to be_a(Player)
      expect(game.instance_variable_get(:@player_2)).to be_a(Player)

    end

  end

end