require 'spec_helper'
require 'player'
require 'computer'

describe Computer do

  let (:computer){Computer.new("", :x)}

  describe "#get_column" do
    it "returns a number between 1 and 7" do
      expect(1..7).to cover(computer.get_column)
    end
  end
end
