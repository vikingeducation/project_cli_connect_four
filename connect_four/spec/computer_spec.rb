require 'player'
require 'computer'

describe Computer do

  let ( :computer ) { Computer.new("green") }
  let ( :computer_no_color ) { Computer.new }

  describe "#initialize" do
    it "initializes properly" do
      expect(computer).to be_an_instance_of(Computer)
    end

    it "initializes properly with color" do
      expect(computer.color).to eq("green")
    end

    it "doesn't initialize without color" do
      expect{computer_no_color}.to raise_error(ArgumentError)
    end
  end

  describe "#player_move" do
    it "returns a column between 0 and 6" do
      expect(computer.player_move).to be_between(0, 6)
    end
  end

end