require 'rspec'
require_relative '../lib/connect_four'

describe ConnectFour do 
  
  let(:game){ ConnectFour.new(false, false) }
  let(:comp_game){ ConnectFour.new(true, false) }
  let(:auto_game){ ConnectFour.new(true, true) }
  
  
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

    it "should play the game not to play if autoplay is set to false" do 
      expect(game).not_to receive(:play)
    end
  end

  describe "#play" do
    it "should render the board" do
      allow(game.player1).to receive(:placement).and_return(1)
      allow(game.player2).to receive(:placement).and_return(2)
      allow(Render).to receive(:placement)
      expect(Render).to receive(:board).at_least(:once)
      game.play
    end

    it "should set the player on the first turn"

    it "should place a new piece on the board"

    it "should reject an invalid move"

    it "should re-render the board after a valid move"

    it "should switch players on unless the game ends"

    it "should declare a winner when the game ends"



  end
end