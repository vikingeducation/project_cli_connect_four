=begin
1. Blackjack class
	- def play game
	- def check_busted
2. Player class
	- Human subclass
		- def money
	- Dealer subclass
	- def hand
		- calculate hand
3. Deck class
	- state of the deck
4. Display module
	- inlcude in Player base class
=end

class Blackjack
	def initialize
		@gambler = Human.new
		@deck = Deck.new
		@dealer = Dealer.new
		@players = [@gambler, @dealer]
	end

	def play
		deal_initial_cards	  #deal initial cards
		until win? || bust?
			puts "Would you like another card?"
			deal_card_to_player   	#deal card to player
							  		#count cards, output score
		end
	end

	def deal_card_to_player(player)
		player.receive_card(@deck.deal_card)
	end

	def deal_initial_cards
		2.times do
			@players.each do |player|
				deal_card_to_player(player)
			end
		end
	end
end

class Player
	attr_reader :hand
	def initialize
		@hand = []
	end

	def receive_card(card)
		@hand.push(card)
	end
end

class Deck
	def initialize
		@deck_state = populate_card_deck
	end

	def populate_card_deck
		deck = []
		suits = ["Hearts", "Clubs", "Spades", "Diamonds"]
		values = (1..13).to_a
    	52.times do |i|
      		deck << {suit: suits[i%4], value: values[i%13]}
		end
		return deck
	end

	def deal_card
		@deck_state.pop
	end
end

class Display
end

class Human < Player
end

class Dealer < Player
end