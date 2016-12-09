require 'player'

describe Player do
  let(:player){Player.new}

  describe '#initialize' do
    it "raises ArgumentError with 0 arguments" do
      expect{player}.to raise_error(ArgumentError)
    end

    it "does not raise error when passed in 3 arguments" do
      expect{Player.new([1],"X",3)}.not_to raise_error
    end
  end

end