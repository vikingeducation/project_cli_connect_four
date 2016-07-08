require 'connect_four'

describe ConnectFour do

  let(:game){ConnectFour.new()}

  describe '#initialize' do

    it "should be able to take no arguments" do
      expect{ConnectFour.new}.not_to raise_error
    end

    it "should create a player" do
      expect(game.instance_variable_get(:@player1)).to be_an_instance_of(Player)
    end

    it "should default to 2 (human) players" do
      expect(game.instance_variable_get(:@player2)).to be_an_instance_of(Player)
    end

    it "should create a computer based on parameter" do
      game_with_comp=ConnectFour.new(:computer)
      expect(game_with_comp.instance_variable_get(:@player2)).to be_an_instance_of(Computer)
    end

    it "should create a board" do
      expect(game.game_board).to be_an_instance_of(Board)
    end

    it "should set a current player" do
      expect(game.current_player).to eq(game.instance_variable_get(:@player1))
    end
  end

end