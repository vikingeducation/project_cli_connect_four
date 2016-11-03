require 'rspec'
require_relative '../lib/connect_four'

describe ConnectFour do 
  
  let(:game){ ConnectFour.new }
  let(:comp_game){ ConnectFour.new(true) }
  
  describe "#initialize" do 

    it "should initialize a blank board" do 
      expect(game.board.board).to eq(Array.new(7) { Array.new(6) })
    end

    it "should create two players" do 
      expect(game.player1).to be_a(Player)
      expect(game.player2).to be_a(Player)
      expect(game.player2).not_to be_a(Computer)
    end

    it "should be able to create a computer player" do 
      expect(comp_game.player2).to be_a(Computer)
    end

    it "should set the correct pieces" do 
      expect(game.player1.piece).to eq("X")
      expect(game.player2.piece).to eq("O")
    end

    it "should start with no current player" do 
      expect(game.current_player).to be_nil
    end
  end

  describe "#play" do 
  end
end