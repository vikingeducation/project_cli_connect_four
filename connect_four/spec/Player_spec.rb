require 'spec_helper'
require 'Player'
require 'ConnectFour'
require 'Board'



describe '.Player' do

	describe '#initilaize' do

		let( :board ) { Board.new }
		let( :piece ) { :R }
		let( :player ) { Player.new( 'Player 1', piece, board )}



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

end #/.Player