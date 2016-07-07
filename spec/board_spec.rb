require_relative "../lib/board.rb"

describe Board do
  	it "is a board" do
		expect(subject).to be_a(Board)
	end

	it "accepts a board array upon creation" do
		expect do
			Board.new(Array.new(6) { Array.new(3) })
		end.not_to raise_error
	end

	describe "#render" do
		it "displays empty board at initialization" do
			expect{subject.render}.to output("#{"\n-------"*6}\n").to_stdout
		end

		it "displays board in progress" do
			progress_board = Board.new([[nil,nil,nil,nil,nil,nil,nil],
										[nil,nil,nil,nil,nil,nil,nil],
										[nil,nil,nil,nil,nil,nil,nil],
										[nil,nil,nil,nil,"X",nil,nil],
										[nil,nil,nil,"O","X",nil,nil],
										["O","O","X","O","X",nil,nil]] )
			expect{progress_board.render}.to output("\n-------\n-------\n-------\n----X--\n---OX--\nOOXOX--\n").to_stdout
		end

		it "displays board thats won" do
			won_board = Board.new( [[nil,nil,nil,nil,nil,nil,nil],
									[nil,nil,nil,nil,nil,nil,nil],
									[nil,nil,nil,nil,"X",nil,nil],
									[nil,nil,nil,nil,"X",nil,nil],
									[nil,nil,nil,"O","X",nil,nil],
									["O","O","X","O","X",nil,nil]] )
			expect{won_board.render}.to output("\n-------\n-------\n----X--\n----X--\n---OX--\nOOXOX--\n").to_stdout
		end
	end

	describe "#add_piece" do
		it "add valid move to board" do
			subject.add_piece(4,"X")
			expect(subject.board_array).to eq( [[nil,nil,nil,nil,nil,nil,nil],
												[nil,nil,nil,nil,nil,nil,nil],
												[nil,nil,nil,nil,nil,nil,nil],
												[nil,nil,nil,nil,nil,nil,nil],
												[nil,nil,nil,nil,nil,nil,nil],
												[nil,nil,nil,nil,"X",nil,nil]] )
		end

		it "returns flase if column is full" do
			full_column_board = Board.new( [[nil,nil,nil,nil,"O",nil,nil],
											[nil,nil,nil,nil,"X",nil,nil],
											[nil,nil,nil,nil,"O",nil,nil],
											[nil,nil,nil,nil,"X",nil,nil],
											[nil,nil,nil,nil,"O",nil,nil],
											[nil,nil,nil,nil,"X",nil,nil]] )
			expect(full_column_board.add_piece(4,"X")).to be false
		end

		it "returns flase if column is not on board" do
			expect(subject.add_piece(10,"X")).to be false
		end
	end
end