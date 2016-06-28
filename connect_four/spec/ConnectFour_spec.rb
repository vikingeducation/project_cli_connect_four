require 'spec_helper'
require 'ConnectFour'
require 'Board'
require 'Player'
require 'CPU'


describe '.ConnectFour' do

	let( :connect_four ) { ConnectFour.new }
	let( :board ) { Board.new }
	let( :player1 ) { Player.new( 'Player 1', :R, board )}

	describe '#num_players' do


		it 'should call the num_players and return a value' do

			 expect(player1).to eq(Player.new( 'Player 1', :R, board ))

		end

	end




end #/.ConnectFour
