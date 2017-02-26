# spec/game_spec.rb

require 'grid'
require 'player'
require 'human'
require 'computer'
require 'game'
include ConnectFour

describe "Game" do
  let (:game) { Game.new }

  describe "#initialize" do
    it "instantiates the Grid object" do
      expect(game.grid).to be_a(Grid)
    end

    it "sets all other instance variables to nil" do
      expect(game.player_one).to be_nil
      expect(game.player_two).to be_nil
      expect(game.current_player).to be_nil
    end
  end

  describe "#victory?" do
    it "returns true if a player has a made a horizontal winning move" do
      game_grid = { 1 => ["X"],
                    2 => ["X"],
                    3 => ["X"],
                    4 => ["X"],
                    5 => ["O"],
                    6 => ["O"],
                    7 => ["O"]
                  }

      col, row = 4, 0
      expect(Game.new(game_grid).victory?([col, row])).to be_truthy

      game_grid = { 1 => ["O", "X"],
                    2 => ["X", "O"],
                    3 => ["X", "O"],
                    4 => ["X", "O"],
                    5 => ["O", "O"],
                    6 => ["O", "X", "X", "X"],
                    7 => ["O"]
                  }

      col, row = 5, 1
      expect(Game.new(game_grid).victory?([col, row])).to be_truthy
    end

    it "returns true if a player has made a vertical winning move" do
      game_grid = { 1 => [],
                    2 => [],
                    3 => ["X", "X", "X", "X"],
                    4 => [],
                    5 => ["O", "O", "O"],
                    6 => [],
                    7 => []
                  }

      col, row = 3, 3
      expect(Game.new(game_grid).victory?([col, row])).to be_truthy

      game_grid = { 1 => [],
                    2 => [],
                    3 => ["X", "X", "X"],
                    4 => [],
                    5 => ["O", "O", "O", "O"],
                    6 => [],
                    7 => []
                  }

      col, row = 5, 3
      expect(Game.new(game_grid).victory?([col, row])).to be_truthy
    end

    it "returns true if a player has made a diagonal winning move" do
      game_grid = { 1 => ["X"],
                    2 => ["O", "X"],
                    3 => ["X", "O", "X"],
                    4 => ["O", "X", "O", "X"],
                    5 => ["O"],
                    6 => [],
                    7 => []
                  }

      col, row = 4, 3
      expect(Game.new(game_grid).victory?([col, row])).to be_truthy

      game_grid = { 1 => ["X"],
                    2 => ["O", "X", "X", "O"],
                    3 => ["X", "O", "O"],
                    4 => ["X", "O", "O"],
                    5 => ["O", "X"],
                    6 => [],
                    7 => []
                  }

      col, row = 2, 3
      expect(Game.new(game_grid).victory?([col, row])).to be_truthy
    end

    it "returns false if a player's move does not win the game" do
      game_grid = { 1 => ["X"],
                    2 => ["X"],
                    3 => ["X"],
                    4 => [],
                    5 => ["O", "X"],
                    6 => ["O"],
                    7 => ["O"]
                  }

      col, row = 5, 1
      expect(Game.new(game_grid).victory?([col, row])).to be_falsey

      game_grid = { 1 => [],
                    2 => [],
                    3 => ["X", "X", "X", "O"],
                    4 => [],
                    5 => ["O", "O", "O"],
                    6 => [],
                    7 => []
                  }

      col, row = 3, 3
      expect(Game.new(game_grid).victory?([col, row])).to be_falsey
    end
  end

  describe "#draw?" do
    it "returns true if the game grid's 42 squares are all filled" do
      full_grid = { 1 => ["X", "X", "X", "X", "X", "X"],
                    2 => ["X", "X", "X", "X", "X", "X"],
                    3 => ["X", "X", "X", "X", "X", "X"],
                    4 => ["X", "X", "X", "X", "X", "X"],
                    5 => ["X", "X", "X", "X", "X", "X"],
                    6 => ["X", "X", "X", "X", "X", "X"],
                    7 => ["X", "X", "X", "X", "X", "X"]
                  }

      expect(Game.new(full_grid).draw?).to be_truthy
    end

    it "returns false if not all the game grid's 42 squares are filled" do
      almost_full_grid = { 1 => ["X", "X", "X", "X", "X", "X"],
                           2 => ["X", "X", "X", "X", "X", "X"],
                           3 => ["X", "X", "X", "X", "X", "X"],
                           4 => ["X", "X", "X", "X", "X", "X"],
                           5 => ["X", "X", "X", "X", "X", "X"],
                           6 => ["X", "X", "X", "X", "X", "X"],
                           7 => ["X", "X", "X", "X", "X"]
                          }

      expect(Game.new(almost_full_grid).draw?).to be_falsey
    end

    it "returns false if the game grid is empty" do
      expect(game.draw?).to be_falsey
    end
  end

  describe "#two_players?" do
    it "returns false if the player has specified the game is single-player" do
      allow(game).to receive(:gets).and_return("1")

      expect(game.two_players?).to be_falsey
    end

    it "returns true if the player has specified the game is two-player" do
      allow(game).to receive(:gets).and_return("2")

      expect(game.two_players?).to be_truthy
    end
  end

  describe "#create_players" do
    it "creates one Human player and one Computer player in a single-player game" do
      allow(game).to receive(:gets).and_return("1")

      game.create_players

      expect(game.player_one).to be_a(Human)
      expect(game.player_one.name).to eq("Mr Cross")
      expect(game.player_one.marker).to eq("X")
      expect(game.player_two).to be_a(Computer)
      expect(game.player_two.name).to eq("Skynet")
      expect(game.player_two.marker).to eq("O")
    end

    it "creates two Human players in a two-player game" do
      allow(game).to receive(:gets).and_return("2")

      game.create_players

      expect(game.player_one).to be_a(Human)
      expect(game.player_one.name).to eq("Mr Cross")
      expect(game.player_one.marker).to eq("X")
      expect(game.player_two).to be_a(Human)
      expect(game.player_two.name).to eq("Ms Nought")
      expect(game.player_two.marker).to eq("O")
    end
  end

  describe "#switch_players" do
    it "initially sets the current player to Player 1" do
      allow(game).to receive(:gets).and_return("2")
      game.create_players
      game.switch_players
      expect(game.current_player).to eq(game.player_one)
    end

    it "switches the current player to Player 2 if it's Player 1, and vice versa" do
      allow(game).to receive(:gets).and_return("2")
      game.create_players
      game.switch_players
      expect(game.current_player).to eq(game.player_one)

      game.switch_players
      expect(game.current_player).to eq(game.player_two)

      game.switch_players
      expect(game.current_player).to eq(game.player_one)
    end

  end

  describe "#quit" do
    it "raises a SystemExit error and exits the game" do
      expect { game.quit }.to raise_error(SystemExit)
    end
  end
end