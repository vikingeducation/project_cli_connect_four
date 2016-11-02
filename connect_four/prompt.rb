class Prompt
	# asks for user inputs as an integer between 1 & 7
  def self.get_input
  	begin
  		puts "Enter column: "
  		input = gets.strip
  	end until Prompt.valid_input?(input)
  	input.to_i
  end

  # validate user input
  def self.valid_input?(input)
    # true if /[1-7]/.match(input)
    # converts boolean type
  	!!input.match(/[1-7]/)
  end
end