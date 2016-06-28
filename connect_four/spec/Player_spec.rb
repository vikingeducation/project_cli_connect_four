require 'spec_helper'
require 'Player'
require 'ConnectFour'
require 'Board'



describe '.Player' do


		let( :board ) { Board.new }
		let( :piece ) { :R }
		let( :player ) { Player.new( 'Player 1', piece, board )}



	describe '#initilaize' do

		it 'should create an instance of player' do

			player1 = player

			expect( player1 ).to be_an_instance_of( Player )

		end




		it 'should only accept 3 parameters' do

			expect{ Player.new( "bob", :R, :B , Board.new )}.to raise_error( ArgumentError)


		end



		it 'should initialize name' do

			expect( player.name ).to eq( "Player 1")

		end



		it 'should initialize board' do

			expect( player.board ).to eq( board )

		end



		it 'should initialize piece' do

			expect( player.piece ).to eq( piece )

		end

	end #/.initialize


	describe '#valid_column?' do

		it 'should return true if input is 1-7' do

			expect( player.valid_column?( 1 )).to be true

		end

		it 'should return false if input is out of range' do

			expect( player.valid_column?( 8 )).to be false

		end

		it 'should return false if user inputs nothing' do

			expect( player.valid_column?("")).to be false

		end

	end #/.valid column


	describe '#exit?' do
		it 'should exit if the input is one of the exit CMDs'
	end


	describe '#ask_for_move' do

		it 'should return the user input as an integer' do

			allow( player ).to receive( :gets ).and_return("4")

			expect( player.ask_for_move ).to eq(4)

		end

	end



end #/.Player