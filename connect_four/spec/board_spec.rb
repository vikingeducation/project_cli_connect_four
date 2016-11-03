require 'spec_helper'
require 'execute'

describe Board do
  describe "#initialize" do
    it "has a layout" do
      expect(Board.new.instance_variable_get(:@layout)).to be_a(Array)
    end

    it "has a last move" do
      expect(Board.new.instance_variable_get(:@last_move)).to eq(nil)
    end


  end

end
