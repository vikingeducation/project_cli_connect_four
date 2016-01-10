require 'human'

describe "Human" do
  let(:human) {Human.new}

  it "should be a Player" do
    expect(human).to be_a(Player)
  end

  describe "#initialize" do
    it "should create a Human" do
      expect(Human.new).to be_a(Human)
    end
  end

  # These work but need input from the keyboard... need to spoof a player
  # describe "#choose_color" do
  #   it "should return red or black" do
  #     expect(["red","black"].include?(human.choose_color)).to eq(true)
  #   end
  # end
  #
  # describe "#choose_column" do
  #   it "should return a number in the range 0..6" do
  #     expect(0..6).to cover(human.choose_column)
  #   end
  # end
end
