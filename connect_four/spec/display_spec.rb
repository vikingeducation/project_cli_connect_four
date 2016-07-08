require 'spec_helper'

describe Display do
  describe ".welcome" do
    it "puts the welcome message" do
      expect(STDOUT).to receive(:puts).with("Welcome to Connect Four!")
      Display.welcome
    end
  end

  describe ".render_grid" do
    it "puts 6 rows of 14 characters (excluding \\n)" do
      expect(STDOUT).to receive(:puts).with()
    end

    it "takes exactly 1 argument"

    it "requires the argument to be an array of 7 arrays"



  end
end
