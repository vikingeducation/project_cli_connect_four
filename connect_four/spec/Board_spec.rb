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




end