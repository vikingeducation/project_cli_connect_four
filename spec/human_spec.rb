require 'spec_helper'
require 'player'
require 'human'

RSpec.describe Human do

  describe 'check_move_valid?' do
    it 'should not take a negative number' do
      expect(Human.new("fred", "red", []).check_move_valid?(-1)).to be false
    end

    it 'should not take a float' do
      pending
      expect (Human.new("fred", "red", []).check_move_valid?(5.9)).to be false
    end

    it 'should not take a string' do
      expect {Human.new("fred", "red", []).check_move_valid?("five")}.to raise_error ArgumentError
    end

    it 'should take a positive number' do
      expect(Human.new("fred", "red", []).check_move_valid?(1)).to be true
    end
  end


end
