require 'spec_helper'
require 'ConnectFour'
require 'Board'
require 'Player'
require 'CPU'


describe '.ConnectFour' do

	let( :connect_four_1 ) { ConnectFour.new( 1 ) }
	let( :connect_four_2 ) { ConnectFour.new( 2 ) }
	describe '#num_players' do


		it 'should call the num_players and return a value' do

			 allow(ConnectFour).to receive(:num_players).and_return(2)
			 expect(ConnectFour.num_players).to eq(2)

		end

	end

	describe '#initialize' do

		it 'should initialize board'

			#expect(@board).to be_an_instance_of(connect_four)


	end

	describe '#change_turns' do

		it 'should change the player when called' do

			ConnectFour.new(1)
			@current_player = @player2
			connect_four_1.change_turns( @current_player )

			expect( @current_player ).to eq( @player1 )

		end


	end



end #/.ConnectFour
