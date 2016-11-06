require 'board'

describe Board do 

	let(:board) { Board.new }
	let(:board_custom) { Board.new(width: 8, height: 10) }

	describe "#initialize" do 

		it "sets a board's width as 7 pieces by default" do 
			expect(board.width).to eq(7)
		end

		it "sets a board's height as 6 pieces by default" do
			expect(board.height).to eq(6)
		end

		it "sets a board's width to a specific width, if desired" do 
			expect(board_custom.width).to eq(8)
		end

		it "sets a board's height to a specific height, if desired" do 
			expect(board_custom.height).to eq(10)
		end 

		it "raises an error if a board is too small" do
			expect do
				Board.new(width: 3, height: 2)
			end.to raise_error(RuntimeError)
		end

	end

	describe "#valid_move?" do 

		it "returns true if column has available spaces" do 
			2.times { board.update(5, 'Y') }
			expect(board.valid_move?(5)).to be true
		end

		it "returns false if column is full" do 
			board.height.times { board.update(3, 'X') }
			expect(board.valid_move?(3)).to be false
		end

	end

	describe "#win?" do 

		it "successfully recognizes a vertical win" do 
			4.times { board.update(3, 'X') }
			expect(board.win?).to be true
		end

		it "successfully recognizes a horizontal win" do 
			(1..4).each { |column| board.update(column, 'X') }
			expect(board.win?).to be true
		end

		it "successfully recognizes a diagonal win (positive slope)" do
			board.update(1,'X')
			board.update(2,'O')
			board.update(2,'X')
			2.times { board.update(3, 'O') }
			board.update(3, 'X')
			3.times { board.update(4, 'O') }
			board.update(4, 'X')	
			expect(board.win?).to be true
		end

		it "successfully recognizes a diagonal win (negative slope)" do
			board.update(board.width,'X')
			board.update(board.width-1,'O')
			board.update(board.width-1,'X')
			2.times { board.update(board.width-2, 'O') }
			board.update(board.width-2, 'X')
			3.times { board.update(board.width-3, 'O') }
			board.update(board.width-3, 'X')
			expect(board.win?).to be true
		end

	end

	describe "#full?" do 

		it "returns true if board is full" do 
			board.width.times do |col_num|
				board.height.times { board.update(col_num, 'X') }
			end
			expect(board.full?).to be true
		end

		it "returns false if board is one piece away from being full" do 
			(board.width-1).times do |col_num|
				board.height.times { board.update(col_num, 'X') }
			end
			(board.height-1).times { board.update(board.width-1, 'X') }
			expect(board.full?).to be false
		end

	end

end