require 'spec_helper'
require 'board'

describe Board do

  let(:board) {Board.new}
  let(:altered_board) {Board.new}
  let(:abc) {Board.new}
  let(:d) {Board.new}

  #describe render
  #end

  describe '#create_board_structure' do
    it 'checks if arrays in game_board are created properly' do
      board.game_board.each_key do |key|
        expect(board.game_board[key]).to match_array([:clear,:clear,:clear,:clear,:clear,:clear])
      end
    end
  end

  describe '#add_piece' do
    it 'checks if succesfully added a piece onto the board' do
      altered_board.add_piece(1,:poop)
      expect(altered_board.game_board[1]).to match_array([:poop,:clear,:clear,:clear,:clear,:clear])
    end
  end

  describe '#column_full?' do
    it 'checks if column is full' do
      (abc.game_board[1].length).times { abc.add_piece(1, :x) }
      expect(abc.column_full?(1)).to be true
    end
  end

  describe '#full?' do
    it 'checks if board is completely full' do
      d.game_board.each_key do |key|
        (d.game_board[key].length).times { d.add_piece(key, :x) }
      end
      expect(d.full?).to be true
    end
  end

  describe '#four_in_a_row?' do
    it 'returns true if sequence has four in a row' do
      winning_combo = [[:clear, :x, :x, :x, :x, :clear]]
      expect(d.four_in_a_row?(winning_combo)).to be true
    end

    it 'returns false if sequence is not a winning combo' do
      not_winning_combo = [[:clear, :x, :clear, :clear, :clear, :clear]]
      expect(d.four_in_a_row?(not_winning_combo)).to be false
    end

    it 'returns false if sequence is empty' do
      not_winning_combo = [[:clear, :clear, :clear, :clear, :clear, :clear]]
      expect(d.four_in_a_row?(not_winning_combo)).to be false
    end
  end

  describe '#diagonals_up' do

  end
end
