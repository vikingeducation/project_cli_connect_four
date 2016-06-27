require 'spec_helper'
require 'Board'


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


	describe "#four_in_a_row"

		it "should return true if there is 4 in a row"

	end




end