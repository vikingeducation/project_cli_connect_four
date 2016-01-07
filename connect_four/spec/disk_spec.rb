require 'disk'

describe Disk do

  describe '#initialize' do

    let(:a) { Disk.make_player_1_disk }

    it "check if owner is set" do
      expect(a.owner).to eq("1")
    end

  end

end
