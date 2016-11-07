class Prompt

  def self.get_input
  	begin
  		Display.ask_input
  		input = gets.strip
      Display.invalid_input
  	end until Prompt.valid_input?(input) && Prompt.valid_length?(input)

  	input.to_i
  end

  def self.valid_input?(input)
    !!input.match(/\A[1-7]\Z/)
  end

  def self.valid_length?(input)
    input.length == 1
  end

  def self.get_replay
    begin
      Display.ask_replay
      replay = gets.strip.downcase
    end until Prompt.valid_replay?(replay)

    replay
  end

  def self.valid_replay?(replay)
    replay == "y" || replay == "n"
  end

end