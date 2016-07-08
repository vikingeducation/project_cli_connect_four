require 'computer'

describe Computer do

  let(:h){Computer.new("X", "player1")}

  describe '#initialize' do

    it 'creates a Computer when a new Computer is made with two arguments' do
      expect(Computer.new("X", "player1")).to be_a Computer
    end

    it 'returns ArgumentError when a new Computer is made with one argument' do
      expect{Computer.new("X")}.to raise_error ArgumentError
    end

    it 'returns ArgumentError when a new Computer is made with three arguments' do
      expect{Computer.new("X", "player1", "other")}.to raise_error ArgumentError
    end

  end

  describe '#get_name' do

    it 'should return its name' do
      expect(h.get_name).to eq("Hal")
    end

  end

  describe '#get_move' do

    it 'should return a valid column number' do
      expect(0..6).to cover(h.get_move[0])
    end

    it 'should return a piece' do
      expect(h.get_move[1]).to eq("X")
    end

  end

end