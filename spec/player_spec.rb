require 'player'

=begin

  initialize
  - new Player made with two arguments is a Player
  - new Player made with one argument returns ArgumentError
  - new Player made with three arguments returns ArgumentError

  piece
  - Player's piece is readable

  position
  - Player's position is readable





=end





describe Player do

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



end