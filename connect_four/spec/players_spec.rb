require 'players'
require 'board'

describe Human do
  before{ allow(STDOUT).to receive(:puts) }
  let(:human){Human.new}
  let(:human_name){Human.new('kiki')}
  let(:human_full){Human.new('kiki', '*')}

  describe "#initialize" do

    it "should be a human" do
      expect(human).to be_a(Human)
    end

    it "should have a default name" do
      expect(human.name).not_to eq(nil)
    end

    it 'accepts just a name' do
      expect{human_name}.not_to raise_error
    end

    it "accepts a name and piece" do
      expect{human_full}.not_to raise_error
    end

    it 'sets name to instance variable' do
      expect(human_name.name).to eq('kiki')
    end

    it 'sets piece to instance variable' do
      expect(human_full.piece).to eq('*')
    end
  end

  # get_move
  describe "#get_move" do

    let(:b){Board.new}

    it 'sets move' do
      allow(human).to receive(:gets).and_return('5')
      human.get_move(b)
      expect(human.move).to eq(4)
    end
  end

  # reset_moves
  describe "#reset_moves" do

    let(:b){ Board.new }

    it 'sets move to empty string' do
      allow(human).to receive(:gets).and_return('5')
      human.get_move(b)
      human.reset_moves
      expect(human.move).to eq(nil)
    end
  end

  # move

end

describe AI do
  let(:ai){ AI.new }
  let(:b){ Board.new }

  # reset_moves
  describe "#reset_moves" do

    it 'sets move to empty string' do

      ai.get_move(b)
      ai.reset_moves
      expect(ai.move).to eq(nil)
    end
  end

  #get_move(board)
  describe '#get_move(board)' do
    it 'sets move' do
      ai.get_move(b)
      expect(ai.move).not_to be_nil

    end
  end

end
