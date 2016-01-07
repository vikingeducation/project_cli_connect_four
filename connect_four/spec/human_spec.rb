require 'spec_helper'
require_relative '../lib/human.rb'

describe "Human" do

  let(:human){ Human.new("R") }

  describe "#select_move" do

    it "return valid input" do
      allow(human).to receive(:gets).and_return("2")
      expect(human.select_move).to eq(2)
    end

    it "loops until input is valid" do
      allow(human).to receive(:gets).and_return("0", "6")
      expect(human.select_move).to eq(6)
    end
  end

end