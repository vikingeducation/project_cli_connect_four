require_relative 'board'
require_relative 'player'

class Machine < Player
  def initialize(token)
    @token = token
    puts "I'm Conrad, I will be Player Two and use the \"O\" token. Let's begin"
  end

   def get_drop_column(board)
     board.drop_column_available
     victory_possible(moves_arr)
   end

   def victory_possible(moves_arr)
     moves_arr.each do |x|
       victory = false
       if @board.add_token(x, token) == @board.winning_combination?
         @board.add_token(x, token)
         victory = true
         break
       end
       if  victory == false
         moves_arr.each do |y|
           if y.nil?
             @board.add_token(y, token)
           end
         end
       end
     end
   end

end
