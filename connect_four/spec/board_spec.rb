require 'spec_helper'
require 'board'

describe Board do
  describe '.initialize' do
    it 'intializes a board' do
      expect(Board.new).to be_a(Board)
    end
  end
end
