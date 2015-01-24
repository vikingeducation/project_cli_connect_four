ConnectFour object

end

Board object: Array of arrays
    [[x,x,x,nil,nil,nil],      <= one column 
     [o,x,nil,nil,nil,nil]]    <= second column
     
     
     board[column] << "o"     <= Move adding 'o' to the "top" of that column

methods:

#Graphics
render

#Modifying the board
validate column_is_not_full
insert_coin_into_column

# Winning conditions
check vertical
check horizontal
check diagonal
end

Player object

end

AI object

end



