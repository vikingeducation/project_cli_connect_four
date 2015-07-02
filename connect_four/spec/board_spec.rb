require 'board'

describe Board do

	

	describe '#initialize' do
		#let(:board){Board.new}
		it 'new board should initialize as an array' do
			board=Board.new
			expect(board.state.class).to be(Array)
		end

		it 'new board instance is deep duplicated' do
			board1=Board.new
			board2=Board.new
		
			expect(board1.state[0].object_id!=board2.state[0].object_id).to be(true)		
		end
	end

	describe '#move' do
		before (:each) do
			@board=Board.new
			@board.move([1,2])
		end
		it 'accepts an array as an argument' do
			expect(@board.state[1].class).to eq(Array)
		end

		it 'adds variable to column' do
			expect(@board.state[1]).to eq([2])
		end
	end

	describe '#winner' do
		# horizontal_winner=
		# vertical_winner=
		xit 'checks horizontal winner and returns winner' do
		end
	end

	# describe '#horizontal_winner' do
	# 	xit 'finds all winning entries in each row' do
	# 	end
	# 	xit 'searches all rows' do
	# 	end
	# end

	# describe '#vertical_winner' do
	# 	xit 'finds all winning entries in each column' do
	# 	end
	# 	xit 'goes through all columns' do
	# 	end
	# end

	describe '#col_full?' do
		xit 'returns true if a column is full' do
		end
	end

	# full?
	# pretty_disc
	# => returns a disc type based on player
	# backslash_winner
	# forwardslash_winner
end
