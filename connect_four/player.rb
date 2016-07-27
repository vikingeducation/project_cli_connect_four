class Player
    attr_accessor :name, :piece

    # initialize
    def initialize(name = "Mystery_Player", piece, board)
        # Set marker type (e.g. X or O)
        raise "Piece must be a Symbol!" unless piece.is_a?(Symbol)
        @name = name
        @piece = piece
        @board = board
    end

    # get_coordinates
    def get_coordinates
        # loop infinitely
        loop do
            # ask_for_coordinates
            coords = ask_for_coordinates

            # IF validate_coordinates_format is true
            if validate_coordinates_format(coords)
                # IF piece can be placed on Board
                if @board.add_piece(coords, @piece)
                    # break the loop
                    break
                end
            end
        end
    end


    # ask_for_coordinates
    def ask_for_coordinates
        # Display message asking for coordinates
        puts "#{@name}(#{@piece}), enter your coordinates in the form x,y:"
        # pull coordinates from command line
        gets.strip.split(",").map(&:to_i)
    end

    # validate_coordinates_format
    def validate_coordinates_format(coords)
        # UNLESS coordinates are in the proper format
        if coords.is_a?(Array) && coords.size == 2
            true
        else
            # display error message
            # Note that returning `nil` acts falsy!
            puts "Your coordinates are in the improper format!"
        end
    end

end
