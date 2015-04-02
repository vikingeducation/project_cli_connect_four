class RPS
  
  def initialize( players )
    @players = players
    @p1 = Player.new(1)
    @p2 = Player.new(2)
    @current_player = @p1
    @tachikoma = Tachikoma.new
    @valid_input = false
  end
  
  def play
    welcome_message
    loop do
      until @valid_input
        prompt_user_input
      end
      # next if !validate_input
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
    puts "Choose your weapon, Player #{@current_player.pid}: Rock ('R'), Paper ('P') or Scissors ('S'). Type 'Q' to quit."
    @current_player.choice = gets.chomp.upcase
    validate_input
    if @players == 2
      puts ""
      puts "Choose your weapon, Player #{@current_player.pid}: Rock ('R'), Paper ('P') or Scissors ('S'). Type 'Q' to quit."
      @current_player.choice = gets.chomp.upcase
      validate_input
    end
  end
  
  def validate_input
    if @current_player.choice == "Q"
      exit
    elsif !["R","P","S"].include?( @current_player.choice )
      if @current_player = @p2
        @current_player = @p1
      end
      puts ""
      puts "Please enter a valid choice!"
    else
      if @players == 2
        if @current_player = @p2
          @valid_input = true
        end
        @current_player = @p2
      else
        @valid_input = true
      end
    end
  end

  def determine_victor
    if @players == 2
      if @p1.beats? ( @p2 )
        puts ""
        puts "Player 1 picks #{@p1.choice}, Player 2 picks #{@p2.choice}. Player 1 wins!"
        puts ""
      else
        puts ""
        puts "Player 2 picks #{@p2.choice}, Player 1 picks #{@p1.choice}. Player 2 wins!"
        puts ""
      end
      @current_player = @p1
      @valid_input = false
    else
      if @p1.beats?( @tachikoma )
        puts ""
        puts "Player 1 picks #{@p1.choice}, Tachikoma picks #{@tachikoma.choice}. Player 1 wins!"
        puts ""
      else
        puts ""
        puts "Tachikoma picks #{@tachikoma.choice}, Player 1 picks #{@p1.choice}. Tachikoma wins!"
        puts ""
      end
      @valid_input = false
    end
  end
  
end