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

		it 'returns the passed piece as a string of 4 chars' do

			string = board.four_in_a_row( :B )

			expect( string ).to eq( "RRRR" )

		end

	end




end