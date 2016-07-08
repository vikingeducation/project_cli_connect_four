require 'spec_helper'
require 'board'

describe Board do

  let(:board) {Board.new}
  let(:altered_board) {Board.new}

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



end