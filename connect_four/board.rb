
module Connect_Four
    class Board
      attr_accessor :board

      def initialize(board = nil)
        # 6 by 7 connect four board
        @board = board || Array.new(6){Array.new(7)}
      end

      # render
        def render
            puts
            @board.each do |row|
                row.each do |cell|
                    # display an existing marker if any, else blank
                    cell.nil? ? print("-") : print(cell.to_s)
                end
                puts
            end
            puts
        end
      
        def add_piece(coords, piece)
            if piece_location_valid?(coords)
                @board[coords[0]][coords[1]] = piece
                true
            else
                false
            end
        end

        def piece_location_valid?(coords)
            if within_valid_coordinates?(coords)
                coordinates_available?(coords)
            end
        end

        def within_valid_coordinates?(coords)
            if (0..5).include?(coords[0]) && (0..6).include?(coords[1])
                true
            else
                puts "Piece coordinates are out of bounds"
            end
        end

        def coordinates_available?(coords)
            if @board[coords[0]][coords[1]].nil?
                true
            else
                puts "There is already a piece there!"
            end
        end

        def winning_combination?(piece)
            winning_diagonal?(piece) || 
            winning_vertical?(piece) ||
            winning_horizontal?(piece) 

        end

        # winning_diagonal - 4 counters diagonally
        def winning_diagonal?(piece)
            diagonals.any? do |diag|
                diag.all?{|cell| cell == piece }
            end
        end

        # winning_vertical - 4 counters vertically
        def winning_vertical?(piece)
            verticals.any? do |vert|
                vert.all?{|cell| prev = cell == piece }
            end
        end

        # winning_horizontal - 4 counters horizontally
        def winning_horizontal?(piece)
            horizontals.any? do |horz|
                horz.all?{|cell| cell == piece }
            end
        end


         # diagonal combinations
        def diagonals
            diagonals = []

            # left to right diagonals
            counter = [0, 1, 2, 3]

            3.times do
                4.times do |i|
                    diagonals << [@board[counter[0]][i],@board[counter[1]][i+1],@board[counter[2]][i+2], @board[counter[3]][i+3]]
                end
                # [j, k, l, m].each { |value| value += 1 }
               counter.map! { |value| value += 1 }
            end
            


            # right to left diagonals
            counter2 = [6, 5, 4, 3] 

            4.times do 
                3.times do |i|
                    diagonals << [@board[i][counter2[0]],@board[i+1][counter2[1]],board[i+2][counter2[2]], @board[i+3][counter2[3]]]
                end
                counter2.map! { |value| value -= 1 }
            end
            
             
            diagonals
             
            
            # @board[0][6], @board[1][5], @board[2][4], @board[3][3]
            # @board[1][6], @board[2][5], @board[3][4], @board[4][3]  
            # @board[2][6], @board[3][5], @board[4][4], @board[5][3]


            # @board[0][5], @board[1][4], @board[2][3], @board[3][2]
            # @board[1][5], @board[2][4], @board[3][3], @board[4][2]
            # @board[2][5], @board[3][4], @board[4][3], @board[5][2]


            # @board[0][4], @board[1][3], @board[2][2], @board[3][1]
            # @board[1][4], @board[2][3], @board[3][2], @board[4][1]
            # @board[2][4], @board[3][3], @board[4][2], @board[5][1] 


            # @board[0][3], @board[1][2], @board[2][1], @board[3][0] 
            # @board[1][3], @board[2][2], @board[3][1], @board[4][0]
            # @board[2][3], @board[3][2], @board[4][1], @board[5][0]
            




             # [
             # [ @board[2][0],@board[3][1],@board[4][2],@board[5][3] ],
             # [ @board[2][1],@board[3][2],@board[4][3],@board[5][4] ],
             # [ @board[2][2],@board[3][3],@board[4][4],@board[5][5] ],
             # [ @board[2][3],@board[3][4],@board[4][5],@board[5][6] ],
            
             
             # [ @board[1][0],@board[2][1],@board[3][2],@board[4][3] ],
             # [ @board[1][1],@board[2][2],@board[3][3],@board[4][4] ],
             # [ @board[1][2],@board[2][3],@board[3][4],@board[4][5] ],
             # [ @board[1][3],@board[2][4],@board[3][5],@board[4][6] ],

             # [ @board[0][0],@board[1][1],@board[2][2],@board[3][3] ],
             # [ @board[0][1],@board[1][2],@board[2][3],@board[3][4] ],
             # [ @board[0][2],@board[1][3],@board[2][4],@board[3][5] ],
             # [ @board[0][3],@board[1][4],@board[2][5],@board[3][6] ]
             # ]
        end

        # vertical combinations
        def verticals
            verticals = []

            counter = [0, 1, 2, 3]

            3.times do
                7.times do |i|
                verticals << [@board[counter[0]][i],@board[counter[1]][i],@board[counter[2]][i], @board[counter[3]][i]]
                end
                counter.map! { |value| value += 1 }
            end

            # 7.times do |i|
            #     verticals << [@board[0][i],@board[1][i],@board[2][i], @board[3][i]]
            # end

            # 7.times do |i|
            #     verticals << [@board[1][i],@board[2][i],@board[3][i], @board[4][i]]
            # end

            # 7.times do |i|
            #     verticals << [@board[2][i],@board[3][i],@board[4][i], @board[5][i]]
            # end
            verticals
        end

        # horizontal combinations
        def horizontals
            horizontals = []

            counter = [0, 1, 2, 3]

            4.times do 
                6.times do |i|
                    horizontals << [@board[i][counter[0]],@board[i][counter[1]],board[i][counter[2]], @board[i][counter[3]]]
                end
                counter.map! { |value| value += 1 }
            end

            # 6.times do |i|
            #     horizontals << [@board[i][0],@board[i][1],@board[i][2], @board[i][3]]
            # end

            # 6.times do |i|
            #     horizontals << [@board[i][1],@board[i][2],@board[i][3], @board[i][4]]
            # end

            # 6.times do |i|
            #     horizontals << [@board[i][2],@board[i][3],@board[i][4], @board[i][5]]
            # end

            # 6.times do |i|
            #     horizontals << [@board[i][3],@board[i][4],@board[i][5], @board[i][6]]
            # end
            horizontals  
        end

        def full?
            @board.all? do |row|
                row.none? {|x| x.nil?}
            end
        end
    end
end