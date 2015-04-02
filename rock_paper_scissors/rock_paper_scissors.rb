class RPS
  
  def initialize
    @p1 = Player.new(1)
    @tachikoma = Tachikoma.new
  end
  
  def play
    welcome_message
    loop do
      prompt_user_input
      next if !validate_input
      @tachikoma.choose
      determine_victor
    end
  end
  
  def welcome_message
    puts ""
    puts "Welcome to rock, paper, scissors!"
    puts ""
  end
  
  def prompt_user_input
    puts ""
    puts "Choose your weapon: Rock ('R'), Paper ('P') or Scissors ('S'). Type 'Q' to quit."
    
    @p1.choice = gets.chomp.upcase
  end
  
  def validate_input
    if @p1.choice == "Q"
      exit
    elsif !["R","P","S"].include?( @p1.choice )
      puts ""
      puts "Please enter a valid choice!"
      false
    else
      true
    end
  end

  def determine_victor
    if @p1.beats?( @tachikoma )
      puts ""
      puts "Player 1 picks #{@p1.choice}, Tachikoma picks #{@tachikoma.choice}. Player 1 wins!"
      puts ""
    else
      puts ""
      puts "Tachikoma picks #{@tachikoma.choice}, Player 1 picks #{@p1.choice}. Tachikoma wins!"
      puts ""
    end
  end
  
end