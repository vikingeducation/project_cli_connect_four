require 'computer'

describe Computer do
  let(:computer){Computer.new("Computron","O")}

  describe '#initialize' do
    it "should take 2 arguments" do
      expect{Computer.new("Computron")}.to raise_error(ArgumentError)
    end

    it "should create a name" do
      expect(computer.name).to eq("Computron")
    end

    it "should create a piece" do
      expect(computer.piece).to eq("O")
    end
  end

  describe '#get_input' do
    it "should return an input which is an Integer" do
    end

    it "should return an input in valid range" do
    end
  end

end