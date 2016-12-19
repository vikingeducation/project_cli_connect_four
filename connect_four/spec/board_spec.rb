require "board"

describe Board do

	describe '#initialize' do

		describe 'arguments' do

	    	it 'can take zero arguments' do
	    		a_board = Board.new
	      		expect{Board.new}.not_to raise_error
	      		expect(a_board.number_of_pos_filled).to eq(0)
	      		expect(a_board.number_of_rows).to eq(6)
	      		expect(a_board.number_of_cols).to eq(7)
	      		expect(a_board.board_array).to eq([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]])
	    	end

	    	it 'can take 1 argument' do
	    		a_board = Board.new(12)
	      		expect{Board.new(12)}.not_to raise_error
	      		expect(a_board.number_of_pos_filled).to eq(0)
	      		expect(a_board.number_of_rows).to eq(12)
	      		expect(a_board.number_of_cols).to eq(7)
	      		expect(a_board.board_array).to eq([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]])
	    	end

	    	it 'can take 2 argument' do
	    		a_board = Board.new(12,17)
	      		expect{Board.new(12,17)}.not_to raise_error
	      		expect(a_board.number_of_pos_filled).to eq(0)
	      		expect(a_board.number_of_rows).to eq(12)
	      		expect(a_board.number_of_cols).to eq(17)
	      		expect(a_board.board_array).to eq([[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0]])
	    	end

	    end

	end

	describe '#transpose' do
		it 'can populate transposed array' do
			a_board = Board.new
			board_array = []
			board_array[0] = [1,2,3,4,5,6,7]
			board_array[1] = [1,2,3,4,5,6,7]
			board_array[2] = [1,2,3,4,5,6,7]
			board_array[3] = [1,2,3,4,5,6,7]
			board_array[4] = [1,2,3,4,5,6,7]
			board_array[5] = [1,2,3,4,5,6,7]
			a_board.board_array = board_array

			board_array_rev = []
			board_array_rev[0] = [1,1,1,1,1,1]
			board_array_rev[1] = [2,2,2,2,2,2]
			board_array_rev[2] = [3,3,3,3,3,3]
			board_array_rev[3] = [4,4,4,4,4,4]
			board_array_rev[4] = [5,5,5,5,5,5]
			board_array_rev[5] = [6,6,6,6,6,6]
			board_array_rev[6] = [7,7,7,7,7,7]
			expect(a_board.board_array_column).to eq(board_array_rev)
		end
	end

	describe '#available_columns' do
		it 'can return available columns' do
			a_board = Board.new
			board_array = []
			board_array[0] = [1,0,3,4,0,6,7]
			board_array[1] = [1,2,3,4,5,6,7]
			board_array[2] = [1,2,3,4,5,6,7]
			board_array[3] = [1,2,3,4,5,6,7]
			board_array[4] = [1,2,3,4,5,6,7]
			board_array[5] = [1,2,3,4,5,6,7]
			a_board.board_array = board_array
			avails = a_board.available_columns
			avails_expected = [1,4]
			expect(avails).to eq(avails_expected)
		end
	end

	describe '#main' do

		before do
			@a_board = Board.new
		end

		describe '#manipulation' do

			it 'can add a piece when possible' do
				board_array = []
				board_array[0] = [1,0,0,4,0,6,7]
				board_array[1] = [1,2,0,4,5,6,7]
				board_array[2] = [1,2,0,4,5,6,7]
				board_array[3] = [1,2,3,4,5,6,7]
				board_array[4] = [1,2,3,4,5,6,7]
				board_array[5] = [1,2,3,4,5,6,7]
				@a_board.board_array = board_array
				piece_added = @a_board.add_piece(2, 1)
				expect(piece_added).to be true
				expect(@a_board.board_array[0][1]).to eq(2)
			end

			it 'will not add a piece when impossible' do
				board_array = []
				board_array[0] = [1,0,0,4,0,6,7]
				board_array[1] = [1,2,0,4,5,6,7]
				board_array[2] = [1,2,0,4,5,6,7]
				board_array[3] = [1,2,3,4,5,6,7]
				board_array[4] = [1,2,3,4,5,6,7]
				board_array[5] = [1,2,3,4,5,6,7]
				@a_board.board_array = board_array
				piece_added = @a_board.add_piece(1, 3)
				expect(piece_added).to be false
				expect(@a_board.board_array[0][3]).to eq(4)
			end

			it 'can remove the top piece in a column' do
				board_array = []
				board_array[0] = [1,0,0,4,0,6,7]
				board_array[1] = [1,2,0,4,5,6,7]
				board_array[2] = [1,2,0,4,5,6,7]
				board_array[3] = [1,2,3,4,5,6,7]
				board_array[4] = [1,2,3,4,5,6,7]
				board_array[5] = [1,2,3,4,5,6,7]
				@a_board.board_array = board_array
				@a_board.remove_piece(3)
				expect(@a_board.board_array[0][3]).to eq(0)
				@a_board.remove_piece(4)
				expect(@a_board.board_array[1][4]).to eq(0)
			end

		end

		describe "#check_win_pos" do

			it 'should return true when win move available horizontaly' do
				a_board_arr = []
				a_board_arr[0] = [0,0,0,0,0,0,0]
				a_board_arr[1] = [0,0,0,0,0,0,0]
				a_board_arr[2] = [0,0,0,0,0,0,0]
				a_board_arr[3] = [0,0,0,0,0,2,1]
				a_board_arr[4] = [1,0,0,0,0,1,2]
				a_board_arr[5] = [1,2,2,2,2,1,2]
				@a_board.board_array = a_board_arr
				win = @a_board.check_winning_pos(2)
				expect(win).to be true
			end

			it 'should return true when win move available vertically' do
				a_board_arr = []
				a_board_arr[0] = [0,0,0,0,0,0,0]
				a_board_arr[1] = [0,0,0,0,0,0,0]
				a_board_arr[2] = [0,0,0,0,0,2,0]
				a_board_arr[3] = [0,0,0,0,0,2,1]
				a_board_arr[4] = [1,0,0,0,0,2,2]
				a_board_arr[5] = [1,2,2,2,1,2,2]
				@a_board.board_array = a_board_arr
				win = @a_board.check_winning_pos(2)
				expect(win).to be true
			end

			it 'should return true when win move available diagonally left to right' do
				a_board_arr = []
				a_board_arr[0] = [0,0,0,0,0,0,0]
				a_board_arr[1] = [0,0,0,0,0,0,0]
				a_board_arr[2] = [0,0,2,0,0,0,0]
				a_board_arr[3] = [0,0,1,2,0,1,1]
				a_board_arr[4] = [1,0,1,1,2,1,2]
				a_board_arr[5] = [1,2,2,2,1,2,2]
				@a_board.board_array = a_board_arr
				win = @a_board.check_winning_pos(2)
				expect(win).to be true
			end

			it 'should return true when win move available diagonally right to left' do
				a_board_arr = []
				a_board_arr[0] = [0,0,0,0,0,0,0]
				a_board_arr[1] = [0,0,0,0,0,0,0]
				a_board_arr[2] = [0,0,0,0,2,0,0]
				a_board_arr[3] = [0,0,1,2,1,1,1]
				a_board_arr[4] = [1,0,2,1,1,1,2]
				a_board_arr[5] = [1,2,2,2,1,2,2]
				@a_board.board_array = a_board_arr
				win = @a_board.check_winning_pos(2)
				expect(win).to be true
			end

			it 'should return false when no win move available' do
				a_board_arr = []
				a_board_arr[0] = [0,0,0,0,0,0,0]
				a_board_arr[1] = [0,0,0,0,0,0,0]
				a_board_arr[2] = [0,0,0,0,0,0,0]
				a_board_arr[3] = [0,0,0,0,0,2,1]
				a_board_arr[4] = [1,0,0,0,0,1,2]
				a_board_arr[5] = [1,2,2,1,2,1,2]
				@a_board.board_array = a_board_arr
				win = @a_board.check_winning_pos(2)
				expect(win).to be false
			end

		end

	end

end