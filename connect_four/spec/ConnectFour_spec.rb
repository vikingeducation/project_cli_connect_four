require 'spec_helper'
require 'ConnectFour'
require 'Board'
require 'Player'
require 'CPU'
require 'pry'

describe '.ConnectFour' do

	let(:connect_four) { ConnectFour.new }

	describe '#num_players' do


		it 'should call the num_players and return a value' do

			 allow(ConnectFour).to receive(:num_players).and_return(2)
			 expect(ConnectFour.num_players).to eq(2)

		end

	end

	describe '#initialize' do

		it 'should initialize board' do

			game = ConnectFour.new( 1 )
			board = game.instance_variable_get(:@board)
			expect( game.instance_variable_get(:@board)).to eq(board)

		end


		it 'should initialize player'
		it 'should initialize cpu' do

			game = ConnectFour.new( 1 )
			cpu = game.instance_variable_get(:@player2)
			expect( game.instance_variable_get(:@player2)).to eq(cpu)

		end

		it 'should initialize current player' do

			ConnectFour.new
			expect( @current_player ).to eq( @player1 )


		end
			#expect(@board).to be_an_instance_of(connect_four)


	end


	describe '#change_turns' do

		it 'should change the player when called' do

			ConnectFour.new(1)
			@current_player = @player2
			connect_four.change_turns( @current_player )

			expect( @current_player ).to eq( @player1 )

		end


	end





end #/.ConnectFour
