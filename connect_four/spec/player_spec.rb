require 'player'
require 'human'
require 'computer'


describe Player do

  let( :player ) { Player.new("red") }
  let( :player_no_color ) { Player.new }

  describe '#initialize' do
    it "initializes properly" do
      expect(player).to be_an_instance_of(Player)
    end

    it "does not initialize without color" do
      expect{player_no_color}.to raise_error(ArgumentError)
    end
  end

  describe '#attr_accessor' do
    it 'should respond to color attribute' do
      expect(player).to respond_to :color
    end
  end
  

  describe '#.build_human_player' do
    it "creates instance of human class" do
      expect(Player.build_human_player("red")).to be_an_instance_of(Human)
    end
  end

  describe '#.build_computer_player' do
    it "creates instance of computer class" do
      expect(Player.build_computer_player("red")).to be_an_instance_of(Computer)
    end
  end

end