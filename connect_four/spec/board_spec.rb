require 'board.rb'

describe Board do
  # initialize

  # winning_combination?
  describe '#winning_combination?' do
    it "returns a boolean value" do

    end

    it "returns true if a winning diagonal combination exists for the given piece" do

    end

    it "returns true if a winning vertical combination exists for the given piece" do

    end

    it "returns true if a winning horizontal combination exists for the given piece" do

    end

    it "returns false if no winning combination exists for the given piece" do

    end
  end

  # full?
  describe '#full?' do
    it "returns false if there are any empty slots" do

    end

    it "returns true if there is a piece in every slot" do

    end
  end

  # add_piece
  describe '#add_piece' do
    it "adds the given piece to the given column" do

    end

    it "adds the given piece to the correct row in the column" do

    end

    it "returns true if the piece has been added to the board" do

    end

    it "returns false if the piece has not been added to the board" do

    end

    it "adds the piece to the column according to the column label displayed to the user" do

    end

    it "does not add the piece to the column according to the zero-based column index" do

    end
  end

  # winning_vertical_available?
  describe '#winning_vertical_available?' do
    it "returns true if there is a move available that will result in a vertical winning combination for the given piece" do

    end

    it "does not return true if there is a move available that will result in a vertical winning combination for a different piece" do

    end
  end

  # winning_vertical_move
  describe '#winning_vertical_move' do
    it "returns the move that will result in a vertical winning combination for the given piece" do

    end

    it "does not return the move that will result in a vertical winning combination for a different piece" do

    end
  end

  # winning_horizontal_available?
  it "returns true if there is a move available that will result in a horizontal winning combination for the given piece" do

  end

  it "does not return true if there is a move available that will result in a horizontal winning combination for a different piece" do

  end

  # winning_horizontal_move
  it "returns the move that will result in a horizontal winning combination for the given piece" do

  end

  it "does not return the move that will result in a horizontal winning combination for a different piece" do

  end

end