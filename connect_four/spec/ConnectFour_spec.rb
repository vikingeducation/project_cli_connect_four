require 'spec_helper'
require 'ConnectFour'
require 'Board'
require 'Player'
require 'CPU'


describe '.ConnectFour' do

	let( :connect_four ) { ConnectFour.new }
	let( :board ) { Board.new }

	describe '#initialize' do

		it 'should create an instance of Board class' do

			allow(connect_four).to receive(:num_players)

		end

	end




end #/.ConnectFour
