require './board'
require './player'
require './human'
require './computer'


class ConnectFour
  def initialize
    @board = Board.new
  end

  def play
    display_welcome
    display_instructions
    prompt_to_continue
    game_mode = ask_for_game_mode
    names = get_names(game_mode)
    color = get_color(game_mode, names)
    turn = get_turn(game_mode, names)
    initialize_players(game_mode, names, color, turn)
    display_game_starting(@player1, @player2)
    @board.render
    until @board.win_on_board?
      if @player1.turn > 0
        move = @player1.get_move(@board.data)
        exit_program if move == 'q'
        puts
        @board.update_board!(move, @player1.color)
        @board.render
        switch_turns
      else  
        move = @player2.get_move(@board.data)
        exit_program if move == 'q'
        puts
        @board.update_board!(move, @player2.color)
        @board.render 
        switch_turns
      end
    end
    display_winner(@board.winning_color)
    exit_program
  end

  private 

  def display_welcome
    puts "Welcome to Connect Four!"
    puts "------------------------"
    puts "You can quit the program at anytime by entering 'q'."
    puts
  end

  def display_instructions
    puts "~ Instructions:"
    puts "> Connect Four is a two-player game in which players take turns"
    puts "dropping colored discs from the top into a 7-column, 6-row grid."
    puts "> The pieces drop straight down, occupying the next available space"
    puts "within the column."
    puts "> The first player to form a horizontal, vertical or diagonal line"
    puts "of four discs wins!"
    puts
  end

  def prompt_to_continue
    print "Enter to continue > "
    exit_program if gets.chomp == 'q'
  end

  def ask_for_game_mode
    puts "Please select a game mode:"
    puts "1) Play against a friend!"
    puts "2) Play against an AI opponent!"
    get_choice_selection(2)
  end

  def get_names(game_mode)
    names = []
    case game_mode
    when '1'
      names << ask_for_name('player 1')
      player2_name = ask_for_name('player 2')
      while names[0] == player2_name
        puts "Same nickname as player 1!"
        player2_name = ask_for_name('player 2')
      end
      names << player2_name
    when '2'
      names << ask_for_name
    end
    names
  end

  def ask_for_name(player = nil)
    if player.nil? 
      puts "Please enter a nickname:" 
    else
      puts "Please enter a nickname for #{player}:"
    end
    input = gets.chomp
    until (3..10).include?(input.length)
       exit_program if input == 'q'
       puts "Nickname must be between 3-10 characters long!"
       input = gets.chomp
    end
    input
  end

  def get_color(game_mode, names)
    case game_mode
    when '1'
      puts "Decide if #{names[0]} will play as (1) #{render_disc('red')} or (2) #{render_disc('yellow')}:"
      puts "(#{names[1]} will then play as the other color.)"
      color = get_choice_selection(2)
    when '2'
      puts "Select a color to play as: (1) #{render_disc('red')}  or (2) #{render_disc('yellow')}"
      color = get_choice_selection(2)
    end
    color
  end

  def get_turn(game_mode, names)
    case game_mode
    when '1'
      puts "Decide who goes first (1) #{names[0]} or (2) #{names[1]}:"
      turn = get_choice_selection(2)
    when '2'
      puts "Enter '1' if you want to go first, or '2' if you want to go second:"
      turn = get_choice_selection(2)
    end
    turn
  end

  def initialize_players(game_mode, names, color, turn)
    player1_attributes = {}
    player2_attributes = {}
    player1_attributes[:name] = names[0]

    if color == '1'
      player1_attributes[:color] = 'red'
      player2_attributes[:color] = 'yellow'
    else
      player1_attributes[:color] = 'yellow'
      player2_attributes[:color] = 'red'
    end

    if turn == '1'
      player1_attributes[:turn] = 1
      player2_attributes[:turn] = -1
    else
      player1_attributes[:turn] = -1
      player2_attributes[:turn] = 1
    end

    @player1 = Human.new(player1_attributes)

    if game_mode == '1'
      player2_attributes[:name] = names[1]
      @player2 = Human.new(player2_attributes)
    else
      @player2 = Computer.new(player2_attributes)
    end
  end

  def display_game_starting(player1, player2)
    puts "> Game is starting now..."
    puts "#{player1.name} #{render_disc(player1.color)} vs. #{player2.name} #{render_disc(player2.color)}"
  end

  def switch_turns
    @player1.turn *= -1
    @player2.turn *= -1
  end

  def display_winner(winning_color)
    if @player1.color == winning_color
      puts "#{@player1.name} wins!"
    else
      puts "#{@player2.name} wins!"
    end
    puts
  end

  def render_disc(color)
    color == 'red' ? "\e[31m#{"\u25CF"}\e[0m" : "\e[33m#{"\u25CF"}\e[0m"
  end

  def get_choice_selection(choices)
    input = gets.chomp
    until (1..choices).to_a.include?(input.to_i)
      exit_program if input == 'q'
      puts "Invalid selection! Please enter '1' or '2'."
      input = gets.chomp
    end
    input
  end

  def exit_program
    puts "Thanks for playing!"
    puts "Exiting..."
    exit
  end
end

ConnectFour.new.play