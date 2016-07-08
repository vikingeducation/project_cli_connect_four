require 'game'

describe Game do

  before do
    allow_any_instance_of(Game).to receive :print_instructions
    allow(Player).to receive(:create_player).and_return("h")
    allow_any_instance_of(Player).to receive :puts
  end

  let(:g){Game.new}

  describe '#initialize' do

    it 'is a new game and has the class Game' do
      expect(g).to be_a Game
    end

    it 'creates a board' do
      expect(g.instance_variable_get( :@board)).to be_a Board
    end

  end

end