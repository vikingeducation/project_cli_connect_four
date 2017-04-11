require 'spec_helper'
require 'player'

RSpec.describe Player do

  describe '#initialize' do

    it 'Init does not init without 3 args' do
      expect {Player.new}.to raise_error ArgumentError
    end

    it 'Init does not init without 1 args' do
      expect {Player.new("rick")}.to raise_error ArgumentError
    end

    it 'Init does not init without 2 args' do
      expect {Player.new("rick", "red")}.to raise_error ArgumentError
    end

    it 'Init does create player with 3 args' do
      expect {Player.new("rick", "red", [])}.not_to raise_error
    end
  end

end
