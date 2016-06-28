require 'spec_helper'
require 'Player'
require 'ConnectFour'
require 'Board'



describe '#initilaize' do

	let( :player ) { Player.new( 'Player 1', :R, Board.new)}

	it 'should create an instance of player' do

		player1 = player

		expect( player1 ).to be_an_instance_of( Player )

	end

	it 'should only accept 3 parameters' do

		expect{ Player.new( "bob", :R, :B , Board.new )}.to raise_error( ArgumentError)


	end


end