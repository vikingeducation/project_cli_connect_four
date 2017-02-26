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

    
    # the #choose_column method has a loop that prompts the user to re-enter
    # input via gets if we determine the initial input is invalid.
    # we set the first gets to return an invalid input, then the second gets to
    # return a valid input.
    it "does not accept anything else as valid input" do
      allow(human).to receive(:gets).and_return("blah", "1")
      expect(human.choose_column).to eq(1)

      allow(human).to receive(:gets).and_return("bleh", "2")
      expect(human.choose_column).to eq(2)

      allow(human).to receive(:gets).and_return("-1.0", "3")
      expect(human.choose_column).to eq(3)

      allow(human).to receive(:gets).and_return("meep", "Q")
      expect(human.choose_column).to eq("q")
    end
  end
end