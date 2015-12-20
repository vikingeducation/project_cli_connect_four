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

  describe '#add_piece_to_board' do

    it 'should raise an error if two arguments arent given' do
      expect{ board.add_piece_to_board }.to raise_error(ArgumentError)
    end

    it 'should pass if column is an integer' do
      expect(board.add_piece_to_board(3,'x')).to eq(nil)
    end

    it 'should pass if piece is a string' do
      expect(board.add_piece_to_board(3,'x')).to eq(nil)
    end

    it 'should replace the space with the piece in a chosen column if there is a space.' do
      board.add_piece_to_board(1,'x')

      expect(board.grid[0][0]).to eq('x')
    end

  end

  describe '#does_column_have_space?' do
    before(:each) do
      board.grid = [[' '],['x']]
    end

    it 'should raise an error if one argument is not given' do
      expect{ board.does_column_have_space? }.to raise_error(ArgumentError)
    end

    it 'should raise an error if more than one argument is given' do
      expect{ board.does_column_have_space?(1,2) }.to raise_error(ArgumentError)
    end

    it 'should pass if argument is an integer' do
      expect(board.does_column_have_space?(1)).to eq(true)
    end

    it 'should fail if piece is a string' do
      expect{ board.does_column_have_space?("one") }.to raise_error(NoMethodError)
    end

    it 'should return false if column does not include a space' do
      expect(board.does_column_have_space?(2)).to eq(false)
    end

  end

  describe '#winner?' do

    it 'should raise an error if one argument is not given' do
      expect{ board.winner? }.to raise_error(ArgumentError)
    end

    it 'should raise an error if more than one argument is given' do
      expect{ board.does_column_have_space?(1,2) }.to raise_error(ArgumentError)
    end

  end

end