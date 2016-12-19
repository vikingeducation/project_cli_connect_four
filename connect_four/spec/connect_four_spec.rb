require "connect_four"

describe ConnectFour do

	describe '#initialize' do

		describe 'arguments' do

	    	it 'does not take arguments' do
	      		expect{ConnectFour.new("Arg")}.to raise_error(ArgumentError)
	    	end # it 'does not take arguments' do

	    	it 'sets instance variables properly' do
	    		a_game = ConnectFour.new
	    		board = a_game.instance_variable_get(:@board)
	      		expect(board).not_to eq(nil)
	      		expect(a_game.game_has_winner).to be false	
	    	end # it 'instantiates a board' do

	    end # describe 'arguments' do

	end # describe '#initialize' do

	describe 'prompt and check input' do

		it 'can check input and validate a yes answer' do
			a_game = ConnectFour.new
			allow(a_game).to receive(:gets).and_return("y")
			user_prompt = a_game.initial_setup
			expect(user_prompt).to eq("y")
		end # it 'can check input and validate a yes answer' do

		it 'can check input and validate a no answer' do
			a_game = ConnectFour.new
			allow(a_game).to receive(:gets).and_return("n")
			user_prompt = a_game.initial_setup
			expect(user_prompt).to eq("n")
		end # it 'can check input and validate a no answer' do

		it 'will loop if bad input received' do
			a_game = ConnectFour.new
			allow(a_game).to receive(:gets).and_return("D").exactly(1).times
			allow(a_game).to receive(:gets).and_return("asdaf").exactly(1).times
			allow(a_game).to receive(:gets).and_return("12313").exactly(1).times
			allow(a_game).to receive(:gets).and_return("y").exactly(1).times
			user_prompt = a_game.initial_setup
			expect(user_prompt).to eq("y")
		end # it 'will loop if bad input received' do

	end # describe 'prompt and check input' do

	describe '#create_player' do

		it 'can create 2 players when both human' do
			a_game = ConnectFour.new
			a_game.create_players("n")
			player1 = a_game.instance_variable_get(:@player1)
			player2 = a_game.instance_variable_get(:@player2)
			both_human = (player1.is_a?(Human)) && (player2.is_a?(Human))
			expect(both_human).to be true
		end # it 'can create 2 players when both human' do

		it 'can create 2 players when one is computer' do
			a_game = ConnectFour.new
			a_game.create_players("y")
			player1 = a_game.instance_variable_get(:@player1)
			player2 = a_game.instance_variable_get(:@player2)
			one_is_computer = (player1.is_a?(Human)) && (player2.is_a?(Computer))
			expect(one_is_computer).to be true
		end # it 'can create 2 players when one is computer' do

	end # describe '#create_player' do

	describe '#switch_players' do

		it 'can switch players' do
			a_game = ConnectFour.new
			a_game.create_players("n")
			a_game.instance_variable_set(:@cur_player, a_game.instance_variable_get(:@player2))
			a_game.determine_next_player
			next_player = a_game.instance_variable_get(:@cur_player)
			expect(next_player).to eq(a_game.instance_variable_get(:@player1))
			a_game.determine_next_player
			next_player = a_game.instance_variable_get(:@cur_player)
			expect(next_player).to eq(a_game.instance_variable_get(:@player2))
		end # it 'can switch players' do

	end # describe '#switch_players' do

	describe '#play' do
		it 'can play with computer and it can win' do
			@a_game = ConnectFour.new
			@a_game.create_players("y")
			allow(@a_game.player1).to receive(:gets).and_return("1","2","1","3","1","2","2","3","3","3","3","2","2","4","5","4")
			@a_game.play
			expect(@a_game.game_has_winner).to be true
		end
	end

end # describe ConnectFour do