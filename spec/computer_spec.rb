require 'computer'

describe "Computer" do
  let(:computer) {Computer.new}

  it "should be a Player" do
    expect(computer).to be_a(Player)
  end

  describe "#initialize" do
    it "should create a Computer" do
      expect(Computer.new).to be_a(Computer)
    end
  end

  describe "#choose_color" do
    it "should return red or black" do
      expect(["red","black"].include?(computer.choose_color)).to eq(true)
    end
  end

  describe "#choose_column" do
    it "should return a number in the range 0..6" do
      expect(0..6).to cover(computer.choose_column)
    end
  end
end
