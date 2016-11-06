require 'board'

describe Board do 

	let(:test_board) { Board.new }

	describe "#initialize" do 

		let(:empty_board) do 
			[
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0]
		  ]
		end

		it "creates an empty board" do 
			expect(test_board.board).to eq(empty_board)
		end

	end

	describe "#update" do

		let(:one_piece_board) do 
			[
		   [0, 0, 0, 0, 'X', 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0]
		  ]
		end

		let(:stack_piece_board) do 
			[
		   [0, 0, 0, 0, 'X', 0, 0], 
		   [0, 0, 0, 0, 'Y', 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0]
		  ]
		end

		it "adds a piece" do 
			test_board.update(5,'X')
			expect(test_board.board).to eq(one_piece_board)
		end

		it "stacks pieces in a column" do 
			test_board.update(5,'X')
			test_board.update(5,'Y')
			expect(test_board.board).to eq(stack_piece_board)
		end

	end

	describe "#valid_move?" do

		let(:column_full_board) do 
			[
		   [0, 0, 0, 0, 'X', 0, 0], 
		   [0, 0, 0, 0, 'Y', 0, 0], 
		   [0, 0, 0, 0, 'X', 0, 0], 
		   [0, 0, 0, 0, 'X', 0, 0], 
		   [0, 0, 0, 0, 'Y', 0, 0], 
		   [0, 0, 0, 0, 'X', 0, 0]
		  ]
		end

		it "returns false if column is full" do
			test_board.instance_variable_set( :@board, column_full_board )
			expect(test_board.valid_move?(5)).to be false
		end

	end

	describe "#win?" do

		let(:horiz_win_board) do 
				[
			   [0, 0, 'X', 'X', 'X', 'X', 0], 
			   [0, 0, 0, 0, 0, 0, 0], 
			   [0, 0, 0, 0, 0, 0, 0], 
			   [0, 0, 0, 0, 0, 0, 0], 
			   [0, 0, 0, 0, 0, 0, 0], 
			   [0, 0, 0, 0, 0, 0, 0]
			  ]
			end

		let(:vert_win_board) do 
			[
		   [0, 0, 0, 0, 'X', 0, 0], 
		   [0, 0, 0, 0, 'Y', 0, 0], 
		   [0, 0, 0, 0, 'Y', 0, 0], 
		   [0, 0, 0, 0, 'Y', 0, 0], 
		   [0, 0, 0, 0, 'Y', 0, 0], 
		   [0, 0, 0, 0, 'X', 0, 0]
		  ]
		end

		let(:diag_tl_br_win_board) do 
			[
		   ['X', 0, 0, 0, 0, 0, 0], 
		   [0, 'X', 0, 0, 0, 0, 0], 
		   [0, 0, 'X', 0, 0, 0, 0], 
		   [0, 0, 0, 'X', 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0]
		  ]
		end		

		let(:diag_tr_bl_win_board) do 
			[
		   [0, 0, 0, 0, 'X', 0, 0], 
		   [0, 0, 0, 'X', 0, 0, 0], 
		   [0, 0, 'X', 0, 0, 0, 0], 
		   [0, 'X', 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0], 
		   [0, 0, 0, 0, 0, 0, 0]
		  ]
		end

		it "returns true for a horizontal win" do

			test_board.instance_variable_set( :@board, horiz_win_board )
			expect(test_board.win?).to be true

		end

		it "returns true for a vertical win" do

			test_board.instance_variable_set( :@board, vert_win_board )
			expect(test_board.win?).to be true

		end

		it "returns true for a top-left to bottom-right diagonal win" do 

			test_board.instance_variable_set( :@board, diag_tl_br_win_board )
			expect(test_board.win?).to be true

		end

		it "returns true for a top-right to bottom-left diagonal win" do

			test_board.instance_variable_set( :@board, diag_tr_bl_win_board )
			expect(test_board.win?).to be true

		end

	end

	describe "#full?" do 

		let(:full_board) do 
			[
		   ['x', 'x', 'x', 'x', 'x', 'x', 'x'], 
		   ['x', 'x', 'x', 'x', 'x', 'x', 'x'], 
		   ['x', 'x', 'x', 'x', 'x', 'x', 'x'], 
		   ['x', 'x', 'x', 'x', 'x', 'x', 'x'], 
		   ['x', 'x', 'x', 'x', 'x', 'x', 'x'], 
		   ['x', 'x', 'x', 'x', 'x', 'x', 'x']
		  ]
		end 		


		let(:almost_full_board) do 
			[
		   ['x', 'x', 'x', 'x', 'x', 'x', 'x'], 
		   ['x', 'x', 'x', 'x', 'x', 'x', 'x'], 
		   ['x', 'x', 'x', 'x', 'x', 'x', 'x'], 
		   ['x', 'x', 'x', 0, 'x', 'x', 'x'], 
		   ['x', 'x', 'x', 'x', 'X', 'x', 'x'], 
		   ['x', 'x', 'x', 'x', 'x', 'x', 'x']
		  ]
		end 	

		it "returns true for a full board" do

			test_board.instance_variable_set( :@board, full_board )
			expect(test_board.full?).to be true

		end

		it "returns false for a board missing one piece" do

			test_board.instance_variable_set( :@board, almost_full_board )
			expect(test_board.full?).to be false

		end

	end

end