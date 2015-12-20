require_relative 'spec_helper'
require_relative '../lib/board'

describe Board do
  let(:board){ Board.new }

  describe '#initialize' do

    it 'should give you a Board' do
      expect(board).to be_a(Board)
    end

    it 'should set up seven arrays with 6 spots in them each' do
      expect(board.grid).to eq([[' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' '], [' ', ' ', ' ', ' ', ' ', ' ']])
    end

    it 'should have a winning move which is nil' do
      expect(board.winning_move).to eq(nil)
    end

  end
end