require 'spec_helper'

describe Display do
  describe ".welcome" do
    it "puts the welcome message" do
      expect(STDOUT).to receive(:puts).with("Welcome to Connect Four!")
      Display.welcome
    end
  end



  describe ".fill" do 
    let(:arr){Array.new(8) { [] }}
    it "requires exactly one argument" do 
      expect{Display.fill("a", "b")}.to raise_error(ArgumentError)
    end

    it "output has elements, which contain at least six elements" do
      expect(Display.fill(arr)[1].length).to be >= 6
    end

    it "fills non-full arrays with hyphens" do 
      expect(Display.fill(arr)[1][rand(5)]).to eq("-")
    end

  end  
end
