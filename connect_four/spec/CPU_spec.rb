require 'spec_helper'
require 'Board'
require 'Player'
require 'pry'

describe '.CPU' do

	let(:board) { Board.new }
	let(:cpu) { CPU.new( "computer", :B, board) }


	describe '#evaluate_board' do
		it 'should return a random number if no winning options' do

			num = cpu.evaluate_board

			expect( num ).to be_a(Fixnum)

		end


		it 'should select a winning row if possible' do

			@board = [
							 "-", "O", "O", "O", "O", "O", "O", "O", "-",
		 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
		 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
		 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
		 				   "-", "O", "O", "O", "O", "O", "O", "O", "-",
		 				   "-", :B, :B, "O", :B, "O", "O", "O", "-"
		 				 ]


		 	num = cpu.evaluate_board

		 	expect( num ).to eq( 3 )

		end

	end

end #/.CPU