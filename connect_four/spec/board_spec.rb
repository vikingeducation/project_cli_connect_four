require 'spec_helper'
require 'board'

describe Board do
  let ( :test_board ){Board.new}
  let ( :test_array ){test_board.board_arr}

  describe '#initialize' do
    it 'intializes a board' do
      expect(test_board).to be_a(Board)
    end
  end

  describe '.board_arr' do
    it 'is an array' do
      expect(test_array).to be_a(Array)
    end
  end

  describe '.game_over?' do
     it 'is false at beginning of game' do
       expect(test_board.game_over?).to equal(false)
     end

     it 'returns true if vertical match' do
       test_array[1][0] = "X"
       test_array[1][1] = "X"
       test_array[1][2] = "X"
       test_array[1][3] = "X"
       expect(test_board.game_over?).to equal(true)
     end

     it 'returns true if horizontal match' do
         test_array[2][6] = "O"
         test_array[3][6] = "O"
         test_array[4][6] = "O"
         test_array[5][6] = "O"
         expect(test_board.game_over?).to equal(true)
     end

     it 'returns true if diagonal match' do
       test_array[3][1] = "Y"
       test_array[2][2] = "Y"
       test_array[1][3] = "Y"
       test_array[0][4] = "Y"
       expect(test_board.game_over?).to equal(true)
     end

     it 'is false if four similar characters are not in sequence' do
       test_array[2][6] = "O"
       test_array[3][6] = "O"
       test_array[4][6] = "O"
       test_array[5][6] = "X"
       test_array[6][6] = "O"
      expect(test_board.game_over?).to equal(false)
    end

    it 'returns true if draw' do
      test_array.each do |row|
        row.map! { |n| n = "*"}
      end
      expect(test_board.game_over?).to equal(true)
    end
  end

end
