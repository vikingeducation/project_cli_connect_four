# class Board
# column_full?
# place(piece_type, column)
# four_in_a_row?
# detected_win?
# vertical_win?(piece_type)
# horizontal_win?(piece_type)
# diagonal_win?(piece_type)
# generate_diagonals(rect_array)
# board_full?

require 'board'

describe Board do

  let(:multipurpose_grid) {[
    [' ',' ','O',' ',' ',' ',' '],
    [' ',' ','O',' ',' ',' ',' '],
    [' ',' ','X','O','O','X','X'],
    [' ',' ','O','X','O','O','X'],
    [' ',' ','O','X','X','X','O'],
    ['X','O','O','X','O','O','X']
  ]}
  let(:multipurpose_board){Board.new(multipurpose_grid)}

  let(:horizontal_win_grid) {[
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ','X','X','X','X',' ',' '],
      [' ',' ',' ',' ',' ',' ',' ']
    ]}
    let(:horizontal_win_board){Board.new(horizontal_win_grid)}

  let(:vertical_win_grid) {[
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ','X',' ',' ',' '],
      [' ',' ',' ','X',' ',' ',' '],
      [' ',' ',' ','X',' ',' ',' '],
      [' ',' ',' ','X',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' ']
    ]}
    let(:vertical_win_board){Board.new(vertical_win_grid)}

  let(:diagonal_win_grid) {[
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ',' ',' ',' ',' '],
      [' ',' ',' ','X',' ',' ',' '],
      [' ',' ','X',' ',' ',' ',' '],
      [' ','X',' ',' ',' ',' ',' '],
      ['X',' ',' ',' ',' ',' ',' ']
    ]}
    let(:diagonal_win_board){Board.new(diagonal_win_grid)}

  describe '#column' do
    it 'takes a column_index as a parameter, flips the board on its side, and returns the column' do
      expect(multipurpose_board.column(2)).to eq(["O", "O", "X", "O", "O", "O"])
    end
  end

  describe '#column_full' do
    it 'takes a column_index and returns true if that column_index is full' do
      expect(multipurpose_board.column_full?(2)).to be_truthy
    end
    it 'takes a column_index and returns false if that column_index is not full' do
      expect(multipurpose_board.column_full?(3)).to be_falsy
    end
  end

  describe '#place' do
    it 'takes a piece_type and a column_index and adds that piece to the first empty space in that column' do
      multipurpose_board.place('O',0)
      expect(multipurpose_board.column(0)).to eq([' ',' ',' ',' ','O','X'])
    end
  end

  describe '#four_in_a_row' do

    it 'checks if there are 4 in a row of piece_type in a short array' do
      short_array = Array.new(3, 'x')
      expect(multipurpose_board.four_in_a_row?(short_array,'x')).to be_falsy
    end

    it 'checks if there are 4 in a row of piece_type in an array of length 4' do
      four_array = Array.new(4, 'x')
      expect(multipurpose_board.four_in_a_row?(four_array,'x')).to be_truthy
    end

    it 'checks if there are 4 in a row of piece_type in a long array' do
      long_array = Array.new(6, 'x')
      expect(multipurpose_board.four_in_a_row?(long_array,'x')).to be_truthy
    end

  end

  describe '#detected_win?' do

    it 'returns true only when a vertical, horizontal, or diagonal win is detected'

  end

  describe '#horizontal_win?' do

    it 'finds a horizontal win in a winning grid' do
      expect(horizontal_win_board.horizontal_win?('X')).to be_truthy
    end

    it 'does not find a horizontal win in a losing grid' do
      expect(multipurpose_board.horizontal_win?('X')).to be_falsy
    end

  end

  describe '#vertical_win?' do

    it 'finds a vertical win in a winning grid' do
      expect(vertical_win_board.vertical_win?('X')).to be_truthy
    end

    it 'does not find a vertical win in a losing grid' do
      expect(multipurpose_board.vertical_win?('X')).to be_falsy
    end

  end

  describe '#diagonal_win?' do

    it 'finds a diagonal win in a winning grid' do
      expect(diagonal_win_board.diagonal_win?('X')).to be_truthy
    end

    it 'does not find a diagonal win in a losing grid' do
      expect(multipurpose_board.diagonal_win?('X')).to be_falsy
    end

  end

# generate_diagonals:
#   it 'lists all the diagonals in a square array'
#   it 'lists all the diagonals in a rectangular array'

# board_full?:
#   it 'returns true if the board is full'
#   it 'returns false if the board is not full'

end
