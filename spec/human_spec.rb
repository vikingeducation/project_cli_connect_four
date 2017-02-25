# spec/human_spec.rb

require 'player'
require 'human'
include ConnectFour

describe "Human" do
  describe "#choose_column" do
    let (:human) { Human.new("Bob", "X") }

    it "accepts values from 1 to 7 as valid input" do
      allow(human).to receive(:gets).and_return("1", "2", "3", "4", "5", "6", "7")

      expect(human.choose_column).to eq(1)
      expect(human.choose_column).to eq(2)
      expect(human.choose_column).to eq(3)
      expect(human.choose_column).to eq(4)
      expect(human.choose_column).to eq(5)
      expect(human.choose_column).to eq(6)
      expect(human.choose_column).to eq(7)
    end

    it "accepts 'Q' or 'q' as valid input" do
      allow(human).to receive(:gets).and_return("Q", "q")

      expect(human.choose_column).to eq("q")
      expect(human.choose_column).to eq("q")
    end

    # need to figure out how to test this with the loop in the method
    it "does not accept anything else as valid input"
  end
end