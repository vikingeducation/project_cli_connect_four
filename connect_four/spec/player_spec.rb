# Tests for player class
# spec/player_spec.rb
require 'spec_helper'
require 'player'
include Connect_Four

describe Player do

  let(:player){ Player.new("TestPlayer", :r, Array.new(2){Array.new(3)})  }


  describe '#initialize' do
    it 'raises an ArgumentError with 1 argument' do
      expect{ Player.new("hello")}.to raise_error(ArgumentError)
    end

    it 'creates a new player with a name' do
      expect(player.name).to eq("TestPlayer")
    end
  end
end