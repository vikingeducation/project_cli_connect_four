# public methods: stack, tos, tos=, insert_disk(marker)
# private methods : -
# test #initialize with rows, 0
# test #stack -
# test #tos - is always <= max
# test #insert_disk(marker)
require_relative '../lib/stack.rb'
describe "Stack" do
  let(:stack_6) { Stack.new(6)}
  let(:stack_0) { Stack.new(0)}
  describe '#initialize' do
    it "should return a stack with array of nil disks" do
      expect(stack_6).to be_a(Stack)
    end
    it "should return a stack with empty array of disks" do
      expect(stack_6).to be_a(Stack)
    end
  end

  describe "#stack" do
    it "should return an array of disks" do
      expect(stack_6.stack).to be_a(Array)
    end

    it "should return an array of 6 disks" do
      expect(stack_6.stack.size).to eq(6)
    end

    it "should return an empty array of 0 disks" do
      expect(stack_0.stack).to be_a(Array)
    end

    it "should return an array of 0 disks" do
      expect(stack_0.stack.size).to eq(0)
    end
  end

  describe "#tos" do
    it "tos should be init to 1" do
      expect(stack_6.tos).to eq(0)
    end
    it "tos for all should be init to 1" do
      expect(stack_0.tos).to eq(0)
    end
  end

  describe "#insert_disk" do
    before(:each) do
      stack_6.insert_disk("x")
      stack_6.insert_disk("o")
      stack_6.insert_disk("x")
    end
    it "inserts disk with x first position" do
      expect(stack_6.stack.first).to eq(Disk.new("x"))
    end
    it "inserts disk with 0 2nd position" do
      expect(stack_6.stack[1]).to eq(Disk.new("o"))
    end
    it "inserts disk with x 3rd position" do
      expect(stack_6.stack[2]).to eq(Disk.new("x"))
    end
    it "last 3 disks will have nil marker" do
      expect(stack_6.stack[3..6]).to eq([Disk.new]*3)
    end
    it "tos will be at index 3" do
      expect(stack_6.tos).to eq(3)
    end
    it "tos overflow" do
      stack_6.insert_disk("x")
      stack_6.insert_disk("x")
      stack_6.insert_disk("x")
      expect(stack_6.insert_disk("x")).to be_nil
    end
  end
end