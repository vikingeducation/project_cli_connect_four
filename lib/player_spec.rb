require_relative '../lib/player.rb'
require_relative '../lib/board.rb'

describe Player do

  let(:p) {Player.new("Tamal", :X, @board)}

  describe 'initialize' do
    it 'creates a new player' do
      expect(p).to be_a(Player)
    end

    it 'has a name' do
      expect(p.name).to eq("Tamal")
    end

    it 'has a piece' do
      expect(p.piece).to eq(:X)
    end
  end

end