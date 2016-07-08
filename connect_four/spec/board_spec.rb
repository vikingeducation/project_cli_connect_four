require 'board'

describe Board do 

let(:b){Board.new}

describe "#initialize" do
  it "display board is initialized"do
    expect(b.display_board).to_not be_nil 
    end
  end

  describe "#display_board" do
    it "allows display_board to be set" do
        expect(b.display_board =[1,2,3]).to eq([1,2,3])
    end
  end

end