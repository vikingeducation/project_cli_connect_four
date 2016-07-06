require_relative "../lib/board.rb"

describe Board do
  	it "is a board" do
		expect(subject).to be_a(Board)
	end
end