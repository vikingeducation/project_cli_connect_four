class Prompt
	# asks for user inputs as an integer between 1 & 7
  def self.get_input
  	begin
  		Display.ask_input

  		input = gets.strip
  	end until Prompt.valid_input?(input)

  	input.to_i
  end

  # validate user input
  def self.valid_input?(input)
    # true if /[1-7]/.match(input)
    # converts boolean type
  	!!input.match(/\A[1-7]\Z/)
  end

  def self.get_replay
    begin
      Display.ask_replay

      replay = gets.strip.downcase
    end until Prompt.valid_replay?(replay)

    replay
  end

  def self.valid_replay?(replay)
    ######
    return true if replay == "y" || replay == "n"
    false
  end
end