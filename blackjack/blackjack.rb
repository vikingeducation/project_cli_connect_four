#Set up game (blackjack)
  #create a deck of cards (deck)
  #create a two players, one human and one dealer (player)
#start the game loop (blackjack)
  #ask player for bet amount (player)
  #render the board (blackjack)
  #ask player for next move (player)
  #if game_over?(blackjack)
    #display proper end game message
    #edit player $$$ according to result (blackjack, player)
    #stop looping
  #else
    #ask player for next move(player)
require './deck.rb'
require './player.rb'
require './dealer.rb'

class Blackjack
  def initialize(bankroll=100)
    @deck = Deck.new
    @player=Player.new(@deck,bankroll)
    @dealer=Dealer.new(@deck)
  end


  def play
    bet_check
    loop do
      break if game_over?
      @deck.render(@player.get_cards,@dealer.get_cards)
      @stand1 = @player.get_move
      @stand2 = @dealer.get_move
    end
    @deck.render(@player.get_cards,@dealer.get_cards)
    end_game_outputs
    play_again?
  end

  def bet_check
    if @player.get_bankroll > 0
      @bet_amount=@player.make_bet
    else 
      puts "You ran out of money :( Go rob a bank and come back to play some more!"
      exit
    end
  end

  def game_over?
    over_21? || stand? || blackjack? || bankroll_empty?
  end


  def over_21?
    @player.get_cards.reduce(:+) > 21 || @dealer.get_cards.reduce(:+) > 21  
  end

  def stand?
    @stand1 == 'stand' && @stand2 == 'stand'
  end

  def blackjack?
    @player.get_cards.length == 2 && @player.get_cards.reduce(:+) == 21 || \
    @dealer.get_cards.length == 2 && @dealer.get_cards.reduce(:+) == 21 
  end

  def bankroll_empty?
    @player.get_bankroll == 0
  end

  def end_game_outputs
    player_total = @player.get_cards.reduce(:+)
    dealer_total = @dealer.get_cards.reduce(:+)
    if stand?
      if player_total > dealer_total #standard player win, no blackjack
        @player.update_bet('w',@bet_amount)
        puts "---------------------------------"
        puts "You win!\nYou: #{player_total} vs. Dealer: #{dealer_total}"
        puts "You won $#{@bet_amount}. Total available: $#{@player.get_bankroll}"
        puts "---------------------------------"
      else
        @player.update_bet('l',@bet_amount)
        puts "---------------------------------"
        puts "You lose!\nYou: #{player_total} vs. Dealer: #{dealer_total}"
        puts " You lost $#{@bet_amount}. Total available: $#{@player.get_bankroll}"
        puts "---------------------------------"
      end
    elsif blackjack?
      if player_total > dealer_total
        @player.update_bet('w',@bet_amount,true)
        puts "---------------------------------"
        puts "Blackjack!\nYou: #{player_total} vs. Dealer: #{dealer_total}"
        puts "You won $#{@bet_amount}. Total available: $#{@player.get_bankroll}"
        puts "---------------------------------"
      else
        @player.update_bet('l',@bet_amount)
        puts "---------------------------------"
        puts "Dealer has blackjack.\nYou: #{player_total} vs. Dealer: #{dealer_total}"
        puts "You lost $#{@bet_amount}. Total available: $#{@player.get_bankroll}"
        puts "---------------------------------"
      end
    elsif player_total > 21
      @player.update_bet('l',@bet_amount)
      puts "---------------------------------"
      puts "Bust!\nYou: #{player_total} vs. Dealer: #{dealer_total}"
      puts "You lost $#{@bet_amount}. Total available: $#{@player.get_bankroll}"
      puts "---------------------------------"
    else
      @player.update_bet('w',@bet_amount)
      puts "---------------------------------"
      puts "Dealer bust!\nYou: #{player_total} vs. Dealer: #{dealer_total}"
      puts "You won $#{@bet_amount}. Total available: $#{@player.get_bankroll}"
      puts "---------------------------------"
    end
  end

  def play_again?
    answer=nil
    loop do 
      puts "Play again? (y/n)"
      answer = gets.chomp.downcase
      break if ['y','n'].include?(answer)
    end
    if answer == 'y'
      restart_game
    else
      exit
    end
  end

  def restart_game
    Blackjack.new(@player.get_bankroll).play
  end


end
