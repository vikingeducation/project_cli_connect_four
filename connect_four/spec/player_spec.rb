require 'player'

describe 'player' do
	let(:player) { Player.new('player1') }

	describe '#initialize' do
		it 'initialized with a  name' do
			expect(player.name).to eq 'player1'
		end
	end

	describe '#choose_symbol' do
		it 'stores symbol if symbol is X or O' do
			# player.gets = 'X'
			allow(player).to receive(:gets).and_return('X')
			player.choose_symbol
			expect(player.symbol).to eq 'X'
		end

		it 'capitalizes input' do
			allow(player).to receive(:gets).and_return('o')
			player.choose_symbol
			expect(player.symbol).to eq 'O'
		end

		it 'asks until symbol is X or O' do
			allow(player).to receive(:gets).and_return('L', 'P', 'x')
			player.choose_symbol
			expect(player.symbol).to eq 'X'
		end
	end

	describe '#choose_column' do
    it 'stores a column if given an integer between 1 and 7' do
			allow(player).to receive(:gets).and_return('1')
      player.choose_column
      expect(player.column).to eq 0
    end

    it 'asks until input is between 1 and 7' do
			allow(player).to receive(:gets).and_return('0','34','3')
      player.choose_column
      expect(player.column).to eq 2
    end
	end
end
