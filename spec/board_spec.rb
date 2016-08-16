require_relative '../lib/board'

describe Board do
  let(:board) { Board.new }

  describe "#initialize" do
    it "should create new board" do
      expect(board).to be_a(Board)
    end

    it "responds to render" do
      expect(board).to respond_to(:render)
    end
    
  end
  
end
