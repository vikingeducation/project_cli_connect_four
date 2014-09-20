# Your code here!

class Game
  def initialize
    @player=Player.new
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

  def rock
    'R'
  end

  def paper
    'P'
  end

  def scissors
    'S'
  end

  def ai_move
    [rock, paper, scissors].sample
  end



  def play
    ai=ai_move
    player_move=@player.get_player_input
    
    comparison=compare_fists(player_move,ai)
    display_results(player_move,ai,comparison)
  end

  def compare_fists(player_choice,ai_choice)
    if player_choice == 'R'
      if ai_choice == 'R'
        'DRAW'
      elsif ai_choice == 'P'
        'YOU LOSE'
      else
        'YOU WIN'
      end
    elsif player_choice == 'P'
      if ai_choice == 'R'
        'YOU WIN'
      elsif ai_choice == 'P'
        'DRAW'
      else
        'YOU LOSE'
      end
    else
      if ai_choice == 'R'
        'YOU LOSE'
      elsif ai_choice == 'P'
        'YOU WIN'
      else
        'DRAW'
      end
    end
  end

  def display_results(p,a,comp)
    puts "\n#######################"
    puts "Player: #{unicode(p)} VS. AI: #{unicode(a)}"
    puts "Result: #{comp}"
    puts "#######################"
  end

end


class Player
  def initialize

  end

  def get_player_input
    loop do
     puts "Select Rock, Paper, or Scissors (R, P, S):"
     choice=gets.chomp.upcase
     return choice if ['R','P','S'].include?(choice)
    end

  end
end


g=Game.new
g.play
