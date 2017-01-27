# Tests for Computer class
# spec/computer_spec.rb
require 'player'
require 'computer'
include Connect_Four

describe Computer do

  let(:computer){ Computer.new("ComputerPlayer", :y, Array.new(2){Array.new(3)})  }

  describe '#initialize' do
    it 'raises an ArgumentError with incorrect number of arguments' do
      expect{ Computer.new("test", :r)}.to raise_error(ArgumentError)
    end

    it 'creates a new computer player with a name' do
      expect(computer.name).to eq("ComputerPlayer")
    end
  end


  describe 'computer generated coordinates' do
    it 'create random x coordinate' do
      expect(0..5).to cover(computer.create_coordinates[0])
    end

    it 'create random y coordinate' do
      expect(0..5).to cover(computer.create_coordinates[1])
    end
  end
end