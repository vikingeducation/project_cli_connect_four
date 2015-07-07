load 'helper.rb'
load 'player.rb'
load 'table.rb'
load 'deck.rb'

class Blackjack
  attr_reader :player_1, :dealer, :table
  include Helper


  def initialize
    @deck = DeckOfCards.new
    @table = Table.new
    @player_1 = Human.new([@deck.card, @deck.card])
    @dealer = Dealer.new([@deck.card, @deck.card])
    @player_1.hand_value = total_hand(@player_1.hand)
    @dealer.hand_value = total_hand(@dealer.hand)
  end


  def play
    end_on_deal?
    play_hand(@player_1)
    play_hand(@dealer)
    @table.render_table(@current_player, @player_1.hand, @dealer.hand)
    determine_winner
  end


  def play_hand(current_player)
    @current_player = current_player
    @table.render_table(@current_player, @player_1.hand, @dealer.hand)
    loop do
      input = @current_player.hit_or_stand
      player_hit if input == "h"
      break if hand_end?(input)
    end
  end


  def dealt_blackjack?
    if blackjack_in_hand?(@dealer.hand)
      return :Dealer
    elsif blackjack_in_hand?(@player_1.hand)
      # payout here?
      return :Player
    end
  end
  

  def end_on_deal?
    dealt_blackjack = dealt_blackjack?
    if dealt_blackjack == :Dealer
      @table.render_table(nil, @player_1.hand, @dealer.hand)
      puts "Bummer, dealer was dealt 21!  Game Over!"
      exit
    elsif dealt_blackjack == :Player
      @table.render_table(nil, @player_1.hand, @dealer.hand)
      puts "Holy smokes, you were dealt 21!  1.5x Payout!"
      exit
    end
  end


  def determine_winner
    if hand_busted?(@player_1.hand) && hand_busted?(@dealer.hand)
      puts "Everyone busted!"
      exit
    end

    winner = winner?(@player_1.hand_value, @dealer.hand_value)
    if winner == nil
      puts "Its a draw!"
    else 
      puts "#{winner} wins!"
    end
  end


  def player_hit
    @current_player.hand << @deck.card
    @current_player.hand_value = total_hand(@current_player.hand)
    @table.render_table(@current_player, @player_1.hand, @dealer.hand)
    @table.players_status << "#{@current_player} Hits!"
  end


  def hand_end?(input)
    blackjack? || busted? || stand?(input) || quit?(input)
  end


  def blackjack?
    if blackjack_in_hand?(@current_player.hand)
      @table.players_status << "#{@current_player} blackjack!"
      return true
    end
  end


  def busted?
    if hand_busted?(@current_player.hand)
      @table.players_status << "#{@current_player} busts at #{total_hand(@current_player.hand)}!"
      return true
    end
  end


  def stand?(input)
    if input == "s"
      @table.players_status << "#{@current_player} stands at #{total_hand(@current_player.hand)}."
      return true
    end
  end


  def quit?(input)
    if input == "q"
      puts "#{@current_player} has quit!"
      exit
    end
  end
  
end



game = Blackjack.new
game.play