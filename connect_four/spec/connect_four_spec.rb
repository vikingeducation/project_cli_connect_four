require 'connect_four'

describe ConnectFour do

  let(:game){ConnectFour.new}

  let(:player_one) do
    double('Human', :set_mode => '1')
  end

  it 'is an instance of ConnectFour' do
    expect(subject).to be_a(ConnectFour)
  end

  describe '#game_intro' do
    it "has the player one call the set_mode method" do
      allow(game).to receive(:set_one_player_settings).and_return(nil)
      allow(game).to receive(:start_game).and_return(nil)
      game.instance_variable_set(:@player_one, player_one)
      expect(game.instance_variable_get(:@player_one)).to receive(:set_mode)
      game.game_intro
    end

    # I guess I want to test that the mode is changed to whatever the player one sets it to.
    it "has the player one set the mode" do
      allow(game).to receive(:set_one_player_settings).and_return(nil)
      allow(game).to receive(:start_game).and_return(nil)
      game.instance_variable_set(:@player_one, player_one)
      game.game_intro
      expect(game.instance_variable_get(:@mode)).to eq('1')
    end

    # I want to see that the set_one_player_settings is set when the @mode is '1'.
    it "runs the set_one_player_settings method when @mode == 1" do
      allow(game).to receive(:set_one_player_settings).and_return(nil)
      allow(game).to receive(:start_game).and_return(nil)
      game.instance_variable_set(:@player_one, player_one)
      expect(game).to receive(:set_one_player_settings)
      game.game_intro
    end

    it "runs the start_game method" do
      allow(game).to receive(:set_one_player_settings).and_return(nil)
      allow(game).to receive(:start_game).and_return(nil)
      game.instance_variable_set(:@player_one, player_one)
      expect(game).to receive(:start_game)
      game.game_intro
    end
  end

end
