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

class Blackjack
  def initialize
    @deck = Deck.new
    @player=Player.new(@deck)
    @dealer=Dealer.new(@deck)
  end

  def play
    loop do
      @deck.render(@player.get_cards,@dealer.get_cards)
      @stand1 = @player.get_move
      @stand2 = @dealer.get_move


      break if game_over?
    end
    @deck.render(@player.get_cards,@dealer.get_cards)
    end_game_outputs
  end

  def game_over?
    @player.get_cards.reduce(:+) > 21 || \
    @dealer.get_cards.reduce(:+) > 21  || \
    (@stand1 == 'stand' && @stand2 == 'stand')
  end

  def end_game_outputs
    player_total = @player.get_cards.reduce(:+)
    dealer_total = @dealer.get_cards.reduce(:+)
    if @stand1 == 'stand' && @stand2 == 'stand'
      if player_total > dealer_total
        puts "You win! Your total is #{player_total}"
      else
        puts "You lose! You had #{player_total}, VS. the dealer's #{dealer_total}"
      end
    elsif player_total > 27
      puts "Bust! You lose. You: #{player_total}, Dealer: #{dealer_total}"
    else
      puts "Dealer bust! You win, #{player_total} vs. Dealer: #{dealer_total}"
    end

  end


end


class Deck
  def initialize
   @deck=create_deck
  end

  def create_deck
    deck= {
      hearts: [],
      diamonds: [],
      spades: [],
      clubs: []
    }
    (2..9).each do |card|
      deck[:hearts] << card
      deck[:diamonds] << card
      deck[:spades] << card
      deck[:clubs] << card
    end
    4.times do #push in the value-10 cards
      deck[:hearts] << 10
      deck[:diamonds] << 10
      deck[:spades] << 10
      deck[:clubs] << 10
    end

    1.times do #push in the aces
      deck[:hearts] << 11
      deck[:diamonds] << 11
      deck[:spades] << 11
      deck[:clubs] << 11
    end
    deck
  end

  def deal_cards(cards=1, player_cards)
    cards.times do |card|
      rand_suit = rand(4)
      rand_card = rand(@deck.to_a[rand_suit][1].length)
      player_cards << @deck.to_a[rand_suit][1][rand_card]
      update_deck(rand_suit,rand_card) #+2 needed to get the actual card, not the index
    end
    player_cards
  end

  def update_deck(suit,card) #remove the cards from the deck as they're dealt to the player
    case suit
      when 0
        @deck[:hearts].delete_at(card)
      when 1
        @deck[:diamonds].delete_at(card)
      when 2
        @deck[:spades].delete_at(card)
      when 3 
        @deck[:clubs].delete_at(card)
    end
  end
  def render(player, dealer)
    puts "Player cards are #{player}"
    puts "Dealer cards are #{dealer}"
  end

end

class Player
  def initialize(deck)
    @deck=deck
    @player_cards = @deck.deal_cards(2, [])
  end

  def get_cards
    @player_cards
  end
  
  def get_move
    choice=nil
    loop do
      puts "What would you like to do? You can (h)it or (s)tand:"
      choice=gets.chomp.downcase
      break if choice == 'h' || choice == 's'
    end
    make_move(choice)
  end

  def make_move(choice)
    if choice == 'h'
      @deck.deal_cards(@player_cards)
    else
      'stand'#return a "stand" message back to Blackjack
    end
  end

end



class Dealer < Player
  def get_move
    if @player_cards.reduce(:+) < 17
      make_move('h') #dealer hits below 17
    else
      make_move('s')
    end
  end

end
Blackjack.new.play