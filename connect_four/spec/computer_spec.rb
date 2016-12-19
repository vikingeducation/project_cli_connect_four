require "computer"
require "board"

describe Computer do

	describe '#initialize' do

		describe 'arguments' do
    	
	    	it 'should raise error without argument' do
	      		expect{Computer.new}.to raise_error(ArgumentError)
	    	end

	    	it 'should be able to take one argument' do
	      		expect{Computer.new(1)}.not_to raise_error
	    	end
	    end

	end

	describe 'instance varibale' do

		it 'should set good instance variables' do
	  		expect(Computer.new(2).color).to eq(2)
	  		expect(Computer.new(1).move).to be_nil
		end

	end

	describe 'picking a move' do

		before do
			@a_computer = Computer.new(2)
		end

		it 'should return a good move when win move available horizontaly' do
			a_board = Board.new
			a_board_arr = []
			a_board_arr[0] = [0,0,0,0,0,0,0]
			a_board_arr[1] = [0,0,0,0,0,0,0]
			a_board_arr[2] = [0,0,0,0,0,0,0]
			a_board_arr[3] = [0,0,0,0,0,2,1]
			a_board_arr[4] = [1,0,0,0,0,1,2]
			a_board_arr[5] = [1,2,2,2,0,1,2]
			a_board.board_array = a_board_arr
			move = @a_computer.drop_a_piece(a_board)
			expect(move).to eq(5)
		end

		it 'should return a good move when win move available vertically' do
			a_board = Board.new
			a_board_arr = []
			a_board_arr[0] = [0,0,0,0,0,0,0]
			a_board_arr[1] = [0,0,0,0,0,0,0]
			a_board_arr[2] = [0,0,0,0,0,0,0]
			a_board_arr[3] = [0,0,0,0,0,2,1]
			a_board_arr[4] = [1,0,0,0,0,2,2]
			a_board_arr[5] = [1,2,2,2,1,2,2]
			a_board.board_array = a_board_arr
			move = @a_computer.drop_a_piece(a_board)
			expect(move).to eq(6)
		end

		it 'should return a good move when win move available diagonally left to right' do
			a_board = Board.new
			a_board_arr = []
			a_board_arr[0] = [0,0,0,0,0,0,0]
			a_board_arr[1] = [0,0,0,0,0,0,0]
			a_board_arr[2] = [0,0,0,0,0,0,0]
			a_board_arr[3] = [0,0,1,2,0,1,1]
			a_board_arr[4] = [1,0,1,1,2,1,2]
			a_board_arr[5] = [1,2,2,2,1,2,2]
			a_board.board_array = a_board_arr
			move = @a_computer.drop_a_piece(a_board)
			expect(move).to eq(3)
		end

		it 'should return a good move when win move available diagonally right to left' do
			a_board = Board.new
			a_board_arr = []
			a_board_arr[0] = [0,0,0,0,0,0,0]
			a_board_arr[1] = [0,0,0,0,0,0,0]
			a_board_arr[2] = [0,0,0,0,0,0,0]
			a_board_arr[3] = [0,0,1,2,1,1,1]
			a_board_arr[4] = [1,0,2,1,1,1,2]
			a_board_arr[5] = [1,2,2,2,1,2,2]
			a_board.board_array = a_board_arr
			move = @a_computer.drop_a_piece(a_board)
			expect(move).to eq(5)
		end

		it 'should return a valid move when win move not available' do
			a_board = Board.new
			a_board_arr = []
			a_board_arr[0] = [1,1,1,2,2,0,1]
			a_board_arr[1] = [2,2,2,1,1,2,2]
			a_board_arr[2] = [1,1,1,2,2,1,2]
			a_board_arr[3] = [2,2,2,1,1,2,1]
			a_board_arr[4] = [1,1,1,2,2,1,2]
			a_board_arr[5] = [2,2,2,1,1,2,2]
			a_board.board_array = a_board_arr
			move = @a_computer.drop_a_piece(a_board)
			expect(move).to eq(5)
		end

	end

end