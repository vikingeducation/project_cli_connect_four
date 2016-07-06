require_relative "../lib/board.rb"

describe Board do
  	it "is a board" do
		expect(subject).to be_a(Board)
	end

	it "accepts a board array upon creation" do
		expect do
			Board.new(Array.new(6) { Array.new(3) })
		end.not_to raise_error
	end
end