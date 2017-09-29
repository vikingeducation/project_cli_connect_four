diagonals = []
row = 3
while row > 0
diagonal = []
row.upto(6) do |num|
  col = num - row
  diagonal << board[num][col]
end
diagonals << diagonal
row -= 1
end

column = 1
while column < 4
row = 1
diagonal = []
  column.upto(6) do |num|
    diagonal << board[row][num]
    row += 1
  end 
  diagonals << diagonal
  column += 1 
end

row = 3
while row > 0
diagonal = []
row.upto(6) do |num|
  col = 6
  diagonal << board[num][col]
  col -= 1
end
diagonals << diagonal
row -= 1
end

column = 5
while column > 2
row = 1
diagonal = []
  column.downto(0) do |num|
    diagonal << board[row][num]
    row += 1
  end 
  diagonals << diagonal
  column -= 1 
end