# Your code here!

class Game
  def initialize(type='single')
    @player=Player.new
    @game_type = type
  end

  def unicode(arg)
    case arg
    when 'R'
      "\u{270A}"
    when 'S'
      "\u{2704}"
    when 'P'
      "\u{270B}"
    end
  end

  def ai_move
    ['R', 'P', 'S'].sample
  end

  def play
    player_move = @player.get_player_input(@game_type == 'single' ? '' : ' 1')
    player_2_move = @game_type == 'single' ? ai_move : @player.get_player_input(' 2')

    comparison=compare_fists(player_move,player_2_move)
    display_results(player_move,player_2_move,comparison)
  end

  def compare_fists(player_1_choice,player_2_choice)
    if player_1_choice == 'R'
      if player_2_choice == 'R'
        'DRAW'
      elsif player_2_choice == 'P'
        'Paper smothers rock. Player 2 wins.'
      else
        'Rock crushes scissors. Player 1 wins.'
      end
    elsif player_1_choice == 'P'
      if player_2_choice == 'R'
        'Paper smothers rock. Player 1 wins.'
      elsif player_2_choice == 'P'
        'DRAW'
      else
        'Scissors cut paper. Player 2 wins.'
      end
    else
      if player_2_choice == 'R'
        'Rock crushes scissors. Player 2 wins.'
      elsif player_2_choice == 'P'
        'Scissors cut paper. Player 1 wins.'
      else
        'DRAW'
      end
    end
  end

  def display_results(p,a,comp)
    puts "\n#############################"
    puts "Player 1: #{unicode(p)}  VS. Player 2: #{unicode(a)}"
    puts "Result: #{comp}"
    puts "#############################"
  end

end


class Player

  def get_player_input(player_num)
    loop do
     puts "Player#{player_num}, select Rock, Paper, or Scissors (R, P, S):"
     choice=gets.chomp.upcase
     return choice if ['R','P','S'].include?(choice)
    end

  end
end

game_type = nil

loop do
  puts "Will you play multi or single player?"
  game_type = gets.chomp
  break if game_type == 'single' || game_type == 'multi'
end

g=Game.new(game_type)
g.play
