require 'game'
require 'board'

describe Game do 
  let(:game) { Game.new }
  let(:board) { Board.new }

  describe "#initialize" do 
    context "argument given" do 
      it "raises an error" do 
        expect{ Game.new("thing") }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#create_players" do 
    context "game type = 1" do 
      before do 
        allow(game).to receive(:gets).and_return('1')
      end
      it "intializes player_1 as a HumanPlayer" do 
        game.create_players
        expect(game.player_1).to be_an_instance_of(HumanPlayer)
      end

      it "intializes player_2 as a ComputerPlayer" do 
        game_type = 1
        game.create_players
        expect(game.player_2).to be_an_instance_of(ComputerPlayer)
      end
    end

     context "game type = 2" do 
      before do 
        allow(game).to receive(:gets).and_return('2')
      end
      it "intializes player_1 as a HumanPlayer" do 
        game.create_players
        expect(game.player_1).to be_an_instance_of(HumanPlayer)
      end

      it "intializes player_2 as a HumanPlayer" do 
        game_type = 1
        game.create_players
        expect(game.player_2).to be_an_instance_of(HumanPlayer)
      end
    end
  end

  describe "#current_player" do 
    context "game.turn is odd" do 
      it "returns player_1" do 
        game.turn = 3 
        expect(game.current_player).to eql(game.player_1)
      end
    end

    context "game.turn is even" do 
      it "returns player_2" do 
        game.turn = 4 
        expect(game.current_player).to eql(game.player_2)
      end
    end
  end

  describe "#current_player_piece" do 
    context "game.turn is odd" do 
      it "returns player_1_piece" do 
        game.turn = 3 
        expect(game.current_player_piece).to eql(game.player_1_piece)
      end
    end

    context "game.turn is even" do 
      it "returns player_2_piece" do 
        game.turn = 4 
        expect(game.current_player_piece).to eql(game.player_2_piece)
      end
    end
  end
end