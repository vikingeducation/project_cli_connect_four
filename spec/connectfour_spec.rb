require_relative "../lib/connectfour.rb"

describe Connectfour do
   	it "is a connect four" do
		expect(subject).to be_a(Connectfour)
	end
end