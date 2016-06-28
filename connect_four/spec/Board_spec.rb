require 'spec_helper'
require 'Board'
require 'pry'

describe '.Board' do

	let( :board ) { Board.new }
  let( :piece ) { :B }



	describe '#initialize' do

		it "should create a @board from the default state" do

			default = [
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-"
	 				 ]

			expect(board.board).to eq( default )

		end

	end


	describe '#player_pieces_as_string' do

		it 'returns a passed piece as a string of 4 chars' do

			string = board.player_pieces_as_string( piece )

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

		it 'should return nil if there is not four in a row' do

			expect( board.four_in_a_row( piece )).to be nil

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

			expect( board.four_in_a_row( piece )).to be true

		end

	end




	describe '#board_as_string_col' do

		it 'should create all columns in one string' do

			column_string = "-OOOOOO-OOOOOO-OOOOOO-OOOOOO-OOOOOO-OOOOOO-OOOOOO"

			expect( board.board_as_string_col ).to eq( column_string )


		end


	end


	describe '#four_in_a_column' do


		it 'should return true if four in a column' do

			board.board = [
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "B", "B", "O", "O", "O", "O", "-"
	 				 ]

			expect( board.four_in_a_column( piece ) ).to be true

		end



		it 'should return nil if no four in a column' do

			expect( board.four_in_a_column( piece ) ).to be nil

		end

	end



	describe '#board_as_string_diag' do

		it 'should generate the board as a string of diagonals' do

			diag = "OOOOOO-OOOOOO-OOOOO-OOOO-OOOO-OOOOO-OOOOOO-OOOOOO-OOOOO-OOOOO-OOOO-OOOO"


			expect( board.board_as_string_diagonal ).to eq( diag )

		end


	end


	describe '#four_in_a_diagonal' do

		it 'should return true if four in a diagonal' do

			board.board = [
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "B", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "B", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "B", "B", "O", "O", "O", "-"
	 				 ]

	 		expect( board.four_in_a_diagonal( piece )).to be true

		end



		it 'should return nil if no four in a diagonal' do

			expect( board.four_in_a_diagonal( piece )).to be nil

		end



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

 			board.drop_piece( 1 , piece )

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



	describe '#victory?' do


		it 'should return true if there is a winning column' do

			board.board = [
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "B", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "B", "O", "B", "O", "O", "O", "-"
	 				 ]

			expect( board.victory?( piece )).to be true

		end

		it 'should return true if there is a winning row' do

			board.board = [
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "B", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "B", "B", "B", "O", "O", "O", "-"
	 				 ]

			expect( board.victory?( piece )).to be true

		end

		it 'should return true if there is a winning diag' do

			board.board = [
						 "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "O", "O", "O", "O", "O", "O", "-",
	 				   "-", "B", "B", "O", "O", "O", "O", "O", "-",
	 				   "-", "O", "O", "B", "O", "O", "O", "O", "-",
	 				   "-", "B", "B", "O", "B", "O", "O", "O", "-"
	 				 ]

			expect( board.victory?( piece )).to be true

		end


		it 'should return nil if there is are no wins' do

			expect( board.victory?( piece )).to be nil

		end


	end

end