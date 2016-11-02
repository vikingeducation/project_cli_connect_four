class Prompt
	# asks for user inputs as an integer between 1 & 7
  def self.get_input
  	begin
  		puts "Enter column: "
  		input = gets.strip
  	end until Prompt.is_valid?(input)
  	input.to_i
  end

  # validate user input
  def self.is_valid?(input)
  	true if /[1-7]/.match(input)
  end
end