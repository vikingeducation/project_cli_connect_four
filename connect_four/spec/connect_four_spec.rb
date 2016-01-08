require 'connect_four'

describe ConnectFour do
  let(:game) { ConnectFour.new }

  describe '#initialize' do
    it "has opponent" do
      expect(game.instance_variable_get(:@opponent)).to eq("2")
    end
  end

  describe '#get_user_input' do

    before(:each) {
      allow(game).to receive(:puts).and_return(nil)
    }

    it 'user input valid' do
      allow(game).to receive(:gets).and_return("1")
      expect(game.get_user_input).to eq(1)
    end

    it 'user input loops until valid input is given' do
      allow(game).to receive(:gets).and_return("poop", "hi", "1")
      expect(game.get_user_input).to eq(1)
    end
  end
  
end
