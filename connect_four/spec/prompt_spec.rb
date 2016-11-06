require 'prompt'

describe Prompt do

  describe ".get_input" do
    it "gets input" do
    	# expect(Prompt).to recieve(:valid_input?).with(false)
    	# expect(Prompt).to recieve(:valid_input?).at_least(:once)
      allow(Prompt).to receive(:gets).and_return("1")
      expect(Prompt.get_input).to eq(1)
    end
  end

end