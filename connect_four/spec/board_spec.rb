require 'board'

describe Board do
	let(:board) {Board.new}
	describe '#initialize' do
		it 'new board should initialize as an array' do
			expect(board.state.class).to be(Array)
		end

		it 'new board instance is deep duplicated' do
			board1=Board.new
			board2=Board.new
			expect(board1.state[0].object_id!=board2.state[0].object_id).to be(true)		
		end
	end

	describe '#move' do
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
		context "checking horizontal winner" do
			it 'checks horizontal winner and returns winner' do
				4.times do
					board.move([0,1])
				end
				expect(board.winner).to be(1)
			end

			it 'finds all winning entries in each row' do
				0.upto(2) do |i|
				 	board_check=Board.new
					board_check.move([i,1])
					board_check.move([i+1,1])
					board_check.move([i+2,1])
					board_check.move([i+3,1])
					expect(board_check.winner).to eq(1)  #does it break the loop here?
				end
			end

			it 'finds winning entries in each column' do
				0.upto(5) do |i|
					board_check = Board.new
					4.times do
						board_check.move([i,1])
					end
					expect(board_check.winner).to eq(1)

				end
			end
		end
	end

	describe '#col_full?' do
		it 'returns true if a column is full' do
			6.times do
				board.move([0,1])
			end
			expect(board.col_full?(0)).to be true
		end
	end
end
