require 'spec_helper'
require 'player'

describe Player do

  let (:player){Player.new("Morgan", ":x")}

  describe "reading instance variables" do

    it "returns name" do
      expect(player.name).to eq("Morgan")
    end

  end

end