RSpec.describe ConnectFour do
  let(:ui_spy) { spy('UiSpy') }
  let(:grid_spy) { spy('GameGrid') }
  let(:game) { ConnectFour.new(ui: ui_spy, grid: grid_spy) }

  before { allow(grid_spy).to receive(:valid_move?) { true } }
  before { allow(game).to receive(:winner?) { true } }

  describe 'starting the game' do

    it 'greets the players and introduces the game' do
      game.play
      expect(ui_spy).to have_received(:welcome)
      expect(ui_spy).to have_received(:rules)
    end

    it 'displays the grid state' do
      game.play
      expect(ui_spy).to have_received(:display_grid).with(grid_spy)
    end

    it 'prompts player 1 to choose a column' do
      game.play
      expect(ui_spy).to have_received(:prompt_player_move)
    end

  end

  describe 'player move recording' do
    context 'valid move' do
      it 'records the move' do
        game.play
        expect(grid_spy).to have_received(:record_move)
      end
    end

    context 'invalid move' do
      it 'prompts player again' do
        allow(grid_spy).to receive(:valid_move?).and_return(false, true)

        game.play
        expect(ui_spy).to have_received(:prompt_player_move).twice
      end
    end
  end

  describe 'ending the game' do
    context 'player wins' do
      before { allow(game).to receive(:winner?) { true } }

      it 'gives winning details' do
        game.play
        expect(ui_spy).to have_received(:display_winner)
        expect(ui_spy).not_to have_received(:display_tie)
      end
    end

    context 'tie game' do
      before { allow(game).to receive(:winner?) { false } }
      before { allow(game).to receive(:tie?) { true } }

      it 'give winning details' do
        game.play
        expect(ui_spy).to have_received(:display_tie)
        expect(ui_spy).not_to have_received(:display_winner)
      end
    end
  end
end
