# public methods: marker, marker=, ==, to_s
# private methods : -
# test #initialize with default, x, 0
# test #== with other disk with same marker
# test #== with different marker disk
# test #to_s returns a string

require_relative '../lib/disk.rb'
describe "Disk" do
  let(:disk) { Disk.new}
  let(:disk_x) { Disk.new('x')}
  let(:disk_x2) { Disk.new('x')}
  let(:disk_o) { Disk.new('o')}

  describe '#initialize' do
    it 'should give you a disk with nil marker' do
      expect(disk).to be_a(Disk)
    end
    it 'should give you a disk with x marker' do
      expect(disk_x).to be_a(Disk)
    end
  end

  describe "#==" do
    it 'should be true when same marker disks are compared' do
      expect(disk_x == disk_x2).to be(true)
    end
    it 'should be false when diff marker disks are compared' do
      expect(disk_x == disk_o).to be(false)
    end
  end

  describe "#to_s" do
    it "should return a string" do
      expect(disk.to_s).to be_a(String)
    end
  end

end