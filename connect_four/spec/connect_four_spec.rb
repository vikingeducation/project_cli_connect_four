require 'connect_four'

describe 'ConnectFour' do
	let(:game) { ConnectFour.new }

	describe '#initialize' do
		it 'it makes a new board' do
			board = game.instance_variable_get(:@board)
			expect(board).to be_a Board
		end

		it 'it makes a new player1' do
			player1 = game.instance_variable_get(:@player1)
			expect(player1).to be_a Player
		end

		it 'it makes a new player2' do
			player2 = game.instance_variable_get(:@player2)
			expect(player2).to be_a Player
		end

		it 'starts turn with player1' do
			turn = game.instance_variable_get(:@turn)
			expect(turn).to eq game.player1
		end

		it 'game status starts as false' do
			game_status = game.game_status
			expect(game_status).to eq false
		end

	end
end





