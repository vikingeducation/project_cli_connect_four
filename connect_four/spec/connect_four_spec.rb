require 'connect_four'
require 'board'
require 'player'
require 'computer'
require 'human'

describe ConnectFour do
  let( :connect_four ) { ConnectFour.new }

  describe "#initialize" do
    it "initializes ConnectFour properly" do
      expect(connect_four).to be_an_instance_of(ConnectFour)
    end

    it "initializes with Player 1 as human" do
      expect(connect_four.player_1).to be_an_instance_of(Human)
    end

    it "initializes with a new board" do
      expect(connect_four.board).to be_an_instance_of(Board)
    end

    it "initializes with Player 1 as the current player" do
      expect(connect_four.current_player).to be(connect_four.player_1)
    end
  end

  describe "#play" do
    xit "continues looping if move doesn't win" do
      # TODO: figure out how to do multiple gets
      allow(connect_four).to receive(:gets).and_return("human")
      connect_four.play
      expect(connect_four.current_player).to eq(connect_four.player_2)
    end

    it "breaks if winning move is made"

  end

  describe "#ask_player_type" do
    it "sets player 2 to human if it receives human as input" do
      allow(connect_four).to receive(:gets).and_return("human")
      connect_four.ask_player_type
      expect(connect_four.player_2).to be_an_instance_of(Human)
    end

    it "sets player 2 to computer if it receives computer as input" do
      allow(connect_four).to receive(:gets).and_return("computer")
      connect_four.ask_player_type
      expect(connect_four.player_2).to be_an_instance_of(Computer)
    end

    it "asks for input again if it receives invalid input" do
      allow(connect_four).to receive(:gets).and_return("alien", "human")
      connect_four.ask_player_type
      expect(connect_four.player_2).to be_an_instance_of(Human)
    end
  end

  describe "#switch_player" do
    it "switches current player from player 1 to player 2" do
      connect_four.switch_player
      expect(connect_four.current_player).to eq(connect_four.player_2)
    end

    it "switches current player from player 2 to player 1" do
      connect_four.current_player = connect_four.player_2
      connect_four.switch_player
      expect(connect_four.current_player).to eq(connect_four.player_1)
    end
  end

  describe "#add_move" do
    it "adds move to current board" do
      expect(connect_four.add_move([5, 0], "R")).to eq("R")
    end
  end

end