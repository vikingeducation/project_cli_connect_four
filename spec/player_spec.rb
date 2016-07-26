require 'player'

describe Player do

  before do
    allow_any_instance_of(Player).to receive :puts
  end

  let(:p){Player.new("X", "player1")}

  describe '#initialize' do

    it 'creates a Player when a new Player is made with two arguments' do
      expect(Player.new("X", "player1")).to be_a Player
    end

    it 'returns ArgumentError when a new Player is made with one argument' do
      expect{Player.new("X")}.to raise_error ArgumentError
    end

    it 'returns ArgumentError when a new Player is made with three arguments' do
      expect{Player.new("X", "player1", "other")}. to raise_error ArgumentError
    end

  end

  describe '#piece' do

    it 'is a piece that can be read' do
      expect(p.piece).to eq("X")
    end

    it 'only gives the correct game piece' do
      expect(p.piece == "O").to be false
    end
  end

  describe '#position' do

    it 'is a position that can be read' do
      expect(p.position).to eq("player1")
    end

    it 'only gives the correct game position' do
      expect(p.position == "player2").to be false
    end

  end

  describe '#get_name' do

    it 'will return the name "Mike" for the get_name method' do
      allow(p).to receive(:gets).and_return("Mike")
      expect(p.get_name("X")).to eq("Mike")
    end

  end

end