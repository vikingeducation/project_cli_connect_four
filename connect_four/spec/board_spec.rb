require 'spec_helper'

describe Board do 
  describe ".initialize" do 

    it "creates a grid of seven empty arrays" do
      expect(Board.new.grid).to eq(Array.new(7){[]})
    end
  end

  describe "#grid" do 
    it ""
  end
end