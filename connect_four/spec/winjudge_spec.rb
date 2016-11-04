require 'spec_helper'
require 'execute'

describe WinJudge do
  let(:layout) {Array.new(7){Array.new(6) {'_'}}}
  let(:last_move) { [0,0] }

  let(:winjudge) {WinJudge.new(layout, last_move)}

  describe "#initialize" do
    it "has a layout" do
      expect(winjudge.instance_variable_get(:@layout)).to eq(layout)
    end

    it "has a last move" do
      expect(winjudge.instance_variable_get(:@last_move)).to eq(last_move)
    end

    it "has a x coord" do
      expect(winjudge.instance_variable_get(:@x_coord)).to eq(last_move[0])
    end

    it "has a y coord" do
      expect(winjudge.instance_variable_get(:@y_coord)).to eq(last_move[1])
    end

    it "has a piece" do
      expect(winjudge.instance_variable_get(:@piece)).to eq('_')
    end



  end

end
