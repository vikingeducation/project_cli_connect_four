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

  let(:grid_1) {[
                 [' ',' ','O',' ',' ',' ',' '],
                 [' ',' ','O',' ',' ',' ',' '],
                 [' ',' ','X','O','O','X','X'],
                 [' ',' ','O','X','O','O','X'],
                 [' ',' ','O','X','X','X','O'],
                 ['X','O','O','X','O','X','X']
               ]}

  let(:board_1){Board.new(grid_1)}

  describe '#column' do
    it 'takes a column_index as a parameter, flips the board on its side, and returns the column' do
      expect(board_1.column(2)).to eq(["O", "O", "X", "O", "O", "O"])
    end
  end

  describe '#column_full' do
    it 'takes a column_index and returns true if that column_index is full' do
      expect(board_1.column_full?(2)).to be_truthy
    end
    it 'takes a column_index and returns false if that column_index is not full' do
      expect(board_1.column_full?(3)).to be_falsy
    end
  end

  describe '#place' do
    it 'takes a piece_type and a column_index and adds that piece to the first empty space in that column' do
      board_1.place('O',0)
      expect(board_1.column(0)).to eq([' ',' ',' ',' ','O','X'])
    end
  end

# place:
#   it 'takes a piece_type and a column_index and adds that piece to the first empty space in that column'

# four_in_a_row?:
#   it 'checks if there are 4 in a row of piece_type in a long array'
#   it 'checks if there are 4 in a row of piece_type in a short array'
#   it 'checks if there are 4 in a row of piece_type in an array of length 4'

# detected_win?:

# horizontal_win?:
#   it 'finds a horizontal win in a winning grid'
#   it 'does not find a horizontal win in a losing grid'

# vertical_win?:
#   it 'finds a vertical win in a winning grid'
#   it 'does not find a vertical win in a losing grid'

# diagonal_win?:
#   it 'finds a diagonal win in a winning grid'
#   it 'does not find a diagonal win in a losing grid'

# generate_diagonals:
#   it 'lists all the diagonals in a square array'
#   it 'lists all the diagonals in a rectangular array'

# board_full?:
#   it 'returns true if the board is full'
#   it 'returns false if the board is not full'

end
