require_relative '../lib/computer.rb'

describe Computer do

  let(:c) {Computer.new("Computer", :X, @board)}

  describe 'initialize' do
    it 'creates a new player' do
      expect(c).to be_a(Computer)
    end

    it 'has a name' do
      expect(c.name).to eq("Computer")
    end

    it 'has a piece' do
      expect(c.piece).to eq(:X)
    end
  end

end