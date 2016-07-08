require 'spec_helper'

describe "Player" do 
  describe ".initialize" do 

    it "requires exactly two arguments" do 
      expect{Display.fill("a", "b", "c")}.to raise_error(ArgumentError)
    end
  end
end

describe "#name" do 
    # just reader
  end

  describe "#piece" do 
    # just reader
  end

end