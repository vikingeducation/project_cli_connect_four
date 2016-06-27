require 'spec_helper'
require 'Board'
require 'pry'

describe '.Board' do

	let( :board ) { Board.new }
	let( :board_array ) { [
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-"
	 				 ] }




	describe '#initialize' do

		it "should create a @board from the default state" do

			expect(board.board).to eq( board_array )

		end

	end


	describe '#player_pieces_as_string' do

		it 'returns a passed piece as a string of 4 chars' do

			string = board.player_pieces_as_string( :B )

			expect( string ).to eq( "BBBB" )

		end

	end


	describe '#board_as_string_row' do

		it "should return the board rows as one string" do

			string_row = board.board.join

			expect( board.board_as_string_row ).to eq( string_row )

		end

	end

	describe '#four_in_a_row' do

		it 'should return false if there is not four in a row' do

			board.board = ([
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-"
	 				 ])

			expect( board.four_in_a_row( :B )).to be false

		end




		it 'should return true if there is 4 in a row' do

			board.board = [
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "B", "B", "B", "O", "O", "O", "-"
	 				 ]

			expect( board.four_in_a_row( :B )).to be true

		end

	end


	describe '#board_as_string_col' do

		it 'should generate the board as a string of columns'


	end


	describe '#four_in_a_column' do

		it 'should return true if four in a column'
		it 'should return false if no four in a column'

	end



	describe '#board_as_string_diag' do

		it 'should generate the board as a string of diagonals'


	end


	describe '#four_in_a_diagonal' do

		it 'should return true if four in a diagonal'
		it 'should return false if no four in a diagonal'

	end



	describe '#draw?' do

		it 'should return true if all positions are filled' do

			board.board = [
					 "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "B", "B", "B", "B", "R", "R", "R", "-"
 				 ]

 			expect( board.draw?).to be true

 		end

 		it 'should return false if there are still open positions' do

 			board.board = [
					 "-", "O", "R", "R", "R", "O", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "B", "B", "B", "B", "R", "R", "R", "-"
 				 ]

 			expect( board.draw?).to be false

 		end

 	end #/.draw?


 	describe '#column_has_room?' do

 		it 'should return true if the top row has O ' do

 			board.board = board_array

 			expect( board.column_has_room?( 1 )).to be true

 		end

 		it 'should return false if the top row as R or B' do

 			board.board = [
					 "-", "O", "R", "R", "R", "O", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "R", "R", "R", "R", "R", "R", "R", "-",
 				   "-", "B", "B", "B", "B", "R", "R", "R", "-"
 				 ]

 			expect( board.column_has_room?( 2 )).to be false

 		end

 	end

 	describe '#drop_piece' do

 		it 'should place the piece in the selected column' do

 			board.drop_piece( 1 , :B )

			dropped_piece = [
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", :B , "O", "O", "O", "O", "O", "O", "-"
	 				 ]

			expect(board.board).to eq( dropped_piece )

		end

	end #/.drop_piece

end