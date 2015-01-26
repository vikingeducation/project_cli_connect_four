class Player

  attr_reader :game_token
  def initialize(game_token)
    @game_token = game_token
  end



  # Returns the column they drop the token into
  def get_move_column
      puts "Make your move, player #{@game_token}.  Which column (0-6)?"
      print "> "
      move = gets.chomp.to_i
      until (0..6).include?(move)
        puts "Nope, try again. 0-6 only, please!"
        print "> "
        move = gets.chomp.to_i
      end
    move
  end


end
