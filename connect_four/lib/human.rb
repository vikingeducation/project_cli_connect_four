=begin
  public : make_move
=end

class Human < Player
  def make_move
    loop do
      move = gets.chomp.to_i
      if move.is_a?(Fixnum) && move.between?(1,7)
        return move
      else
        puts "Did you choose a column between 1 and 7 ?"
      end
    end
  end

end