require './blackjack.rb'
class Player
  def initialize(deck, bankroll=100)
    @deck=deck
    @player_cards = @deck.deal_cards(2, [])
    @player_stands = false
    @bankroll = bankroll
  end

  def get_cards
    @player_cards
  end

  def make_bet
    loop do 
      puts "How much would you like to wager? You have $#{@bankroll} remaining."
      bet_amount = gets.chomp.to_i
      return bet_amount if bet_amount <= @bankroll
    end
  end

  def update_bet(result,amount,bj=false)
    if result == 'w'
      @bankroll += bj ? 1.5*amount : amount #pay 1.5x for blackjack and 1x for normal win
    elsif result == 'l'
      @bankroll -= amount
    end
  end

  def get_bankroll
    @bankroll
  end
  
  def get_move
    choice=nil
    if @player_stands == true
      make_move('s')
    else
      loop do
        puts "What would you like to do? You can (h)it or (s)tand:"
        choice=gets.chomp.downcase
        break if choice == 'h' || choice == 's'
      end
      make_move(choice)
    end
  end

  def make_move(choice)
    if choice == 'h'
      @deck.deal_cards(@player_cards)
    else
      @player_stands = true
      'stand'#return a "stand" message back to Blackjack
    end
  end

end