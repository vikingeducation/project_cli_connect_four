require_relative 'board'
require_relative 'player'

class Machine < Player
  attr_reader :name, :token
  def initialize(token, board)
    @token = token
    @board = board
    @name = "Conrad"
    puts "I'm Conrad, I will be Player Two and use the \"#{@token}\" token. Let's begin"
  end

   def get_drop_column
     moves_arr = @board.rows_available
     move(moves_arr)
   end

   def move(moves_arr)
     moves_arr.each do |y|
       victory = false
       if victory_possible(moves_arr)
         return true
       end
       if  victory == false
         6.times do |x|
           if !moves_arr[x].nil?
             @board.drop = x
             break
           end
         end
         @board.add_token
         break
       end
     end
   end

   def victory_possible(moves_arr)
     moves_arr.each do |y|
       if !y.nil?
         if !moves_arr[y].nil?
           @board.drop = y
          @board.add_token
            if @board.winning_combination?
              return true
            else
              @board.remove_test
            end
         end
       end
      end
      return false
   end
end
