=begin
  Public interface:
    initialize
    choose_column

  Test paths:
    choose_column
      - test it with a mock
      - test for valid input, e.g. q, Q, 1 to 7
      - test for invalid input (anything else)
=end

module ConnectFour

  class Human < Player
    def initialize(name, marker)
      super
    end

    # asks human player which column to place his marker in
    def choose_column
      loop do
        print "Please enter a column to place your marker in: "
        column = gets.chomp.downcase

        # user indicated he wants to quit
        return column if column == 'q'

        return column.to_i if (1..7).include?(column.to_i)

        puts "Your input is invalid, please try again."
      end
    end
  end
end