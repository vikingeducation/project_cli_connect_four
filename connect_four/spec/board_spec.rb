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
		#subject (:@board) {Board.new}
		let(:board) {Board.new}
		before(:each) do
			board.move([1,2])
		end

		it 'accepts an array as an argument' do
			expect(board.state[1].class).to eq(Array)
		end

		it 'adds variable to column' do
			expect(board.state[1]).to eq([2])
		end
	end

	describe '#winner' do
		let(:board) {Board.new}
		context "checking horizontal winner" do
			it 'checks horizontal winner and returns winner' do
				4.times do
					board.move([0,1])
				end	
				expect(board.winner).to be(1)
			end
			
			it 'finds all winning entries in each row' do
				
				
				# 0.upto(3) do |i|
				 	board_check=Board.new
					i=0
					board_check.move([i,1])
					board_check.move([i+1,1])
					board_check.move([i+2,1])
					board_check.move([i+3,1])

					expect(board.winner).to eq(1)
					
				# end
			end


			xit 'searches all rows' do
			end
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
