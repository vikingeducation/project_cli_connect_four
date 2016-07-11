# # game
# # => play
# # => game over?
# # => another card?
# # => victory conditions met?
#
# # player
# # =>
#
# player and dealer established
#   # => initialize game with players
# game starts
# cards are dealt
# player asks for additional card unless blackjack? || total > 21
# player loses if total of cards over 21
# dealer takes additional cards unless total > 16
# win/lose determined
#
# game class:
#   initialize
#     better
#     dealer
#   play game
#   deal cards
#   asks players for additional cards unless undesired conditions met
#   win/lose
#
# player class:
#   initialize
#     name
#   dealt cards
#     hidden card
#     showing card
#   additional cards desired?
#   hit
#
# better class:
#   ask better for hit? unless total > 21
#   card total
#
# dealer class:
#   ask dealer for hit? unless total > 16
#
#
