# class Prompt

#   def self.get_input
#   	begin
#   		input = gets.strip
#   	end until valid_input?(input)
#   	input.to_i
#   end

#   # def self.get_replay
#   #   begin
#   #     Display.ask_replay
#   #     replay = gets.strip.downcase
#   #   end until Prompt.valid_replay?(replay)

#   #   replay
#   # end

#   # def self.valid_replay?(replay)
#   #   return true if replay == "y" || replay == "n"
#   #   false
#   # end

#   def valid_input?(input)
#     valid_length?(input) 
#     !!input.match(/\A[1-7]\Z/)
#   end

#   def valid_length?(input) 
#     input.length == 1
#   end
  
# end