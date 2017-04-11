class ConnectFourPresenter
  def display_grid(grid)
    puts grid.to_s
  end

  def display_tie(grid)
    puts 'Tie game'
    display_grid(grid)
  end

  def display_winner(player, grid)
    puts "#{player.name} won! Here's the grid:"
    display_grid(grid)
  end

  def prompt_player_move(player_name)
    print "#{player_name}--choose a column 1 - 7: "
    gets.chomp
  end

  def rules
    puts 'Rules message here.'
  end

  def welcome
    puts 'Welcome message here.'
  end
end