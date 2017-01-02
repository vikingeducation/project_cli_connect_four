# Layout of the board
class Board

  attr_accessor :board

  def initialize
    @board_arr = board_arr || Array.new(6){Array.new(7)}
  end

  # render
    def render
        puts
        # loop through data structure
        @board_arr.each do |row|
            row.each do |cell|
                # display an existing marker if any, else blank
                cell.nil? ? print("-") : print(cell.to_s)
            end
            puts
        end
        puts
    end
  
    # add_piece
    def add_piece(coords, piece)
        # IF piece_location_valid?
        if piece_location_valid?(coords)
            # place piece
            @board_arr[coords[0]][coords[1]] = piece
            true
        else
            false
        end
    end

    # piece_location_valid?
    def piece_location_valid?(coords)
        # Is the placement within_valid_coordinates?
        if within_valid_coordinates?(coords)
            # Are the piece coordinates_available?
            coordinates_available?(coords)
        end
    end

    # within_valid_coordinates?
    def within_valid_coordinates?(coords)
        # UNLESS piece coords are in the acceptible range
        if (0..5).include?(coords[0]) && (0..6).include?(coords[1])
            true
        else
            puts "Piece coordinates are out of bounds"
        end
    end

    # coordinates_available?
    def coordinates_available?(coords)
        # UNLESS piece coords are not occupied
        if @board_arr[coords[0]][coords[1]].nil?
            true
        else
            # display error message
            puts "There is already a piece there!"
        end
    end

  def winning_combination?(piece)
        # is there a winning_diagonal?
        # or winning_vertical? 
        # or winning_horizontal? for that piece?
        winning_diagonal?(piece)   || 
        winning_horizontal?(piece) || 
        winning_vertical?(piece)
    end

    # winning_diagonal?
    def winning_diagonal?(piece)
        # check if specified piece has a triplet across diagonals
        diagonals.any? do |diag|
            diag.all?{|cell| cell == piece }
        end
    end

    # winning_vertical?
    def winning_vertical?(piece)
        # check if specified piece has a triplet across verticals
        verticals.any? do |vert|
            vert.all?{|cell| cell == piece }
        end
    end

    # winning_horizontal?
    def winning_horizontal?(piece)
        # check if specified piece has a triplet across horizontals
        horizontals.any? do |horz|
            horz.all?{|cell| cell == piece }
        end
    end

     # diagonals
    def diagonals
        # return the diagonal pieces
        [[ @board_arr[0][0],@board_arr[1][1],@board_arr[2][2], @board_arr[1][1] ],[ @board_arr[2][0],@board_arr[1][1],@board_arr[0][2] ]]
    end

    # verticals
    def verticals
        # return the vertical pieces
        verticals = []
        7.times do |i|
            verticals << [@board_arr[0][i],@board_arr[1][i],@board_arr[2][i], board_arr[3][i], board_arr[4][i],board_arr[5][i], board_arr[6][i]]
        end
        verticals
    end

    # horizontals
    def horizontals
        # return the horizontal pieces
        @board_arr
    end

    # full?
    def full?
        # does every square contain a piece?
        @board_arr.all? do |row|
            # row.none?(&:nil?)
            row.none? {|x| x.nil?}
        end
    end

end