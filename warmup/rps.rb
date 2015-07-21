class Judge
  attr_writer :result
  
  def init
    @result = 0
  end
  
  def judge (weapon1, weapon2)
    
    @result = weapon1 * weapon2
    
    puts "scissor destroy paper" if @result == 2
    puts "paper destroy rock" if @result == 6
    puts "rock destroy scissor" if @result == 3
    puts "that's a draw" if [1,4,9].include?(@result)
    
    @result
  end
  
end

class User
  attr_writer :result
  
  def input(name)
    puts "#{name}, input what you want 1: scissor, 2: paper 3: rock, q for quit"
    
    @result = gets.chomp
    abort "you quit the game" if @result == "q"    
    while !["1", "2", "3", "q"].include?(@result) do
      puts "you have enter a wrong number, enter again"
      @result = gets.chomp
      abort "you quit the game" if @result == "q"
    end
    puts "#{name} choose scissor" if @result == "1"
    puts "#{name} choose paper" if @result == "2"
    puts "#{name} choose rock" if @result == "3"
    @result.to_i
    
  end
  
  def ai_user
    
    @result = ["1", "2", "3"].sample 
    puts "AI choose scissor" if @result == "1"
    puts "AI choose paper" if @result == "2"
    puts "AI choose rock" if @result == "3"
    @result.to_i
    
  end
  
end
  
class Game

  def inter_game
    
    user = User.new
    ai = User.new
    judge = Judge.new
    loop do
      weapon1 = user.input("user")
      weapon2 = ai.ai_user
      judge.init
      result = judge.judge(weapon1,weapon2)  
    end
    
  end
  
  def two_game
    user1 = User.new
    user2 = User.new
    judge = Judge.new
    
    loop do
      weapon1 = user1.input("user1")
      weapon2 = user2.input("user2")
      judge.init
      result = judge.judge(weapon1,weapon2)  
    end
    
  end
   
  def start
    
    puts "which mode do you want, paly with the computer or play with your friend"
    puts "1 for play with computer, 2 for play with a friend"
    
    input = gets.chomp
    while (!["1","2"].include?(input)) do
      puts "you enter a wrong choice, enter again"
    end
    
    inter_game if input == "1"
    two_game if input == "2"
    
  end
  
end

a = Game.new
a.start
      