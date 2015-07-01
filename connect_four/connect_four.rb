=begin
1. class Player
	- get input (c1 thru c6)
	- def validate move
		- check_move?
		- does a simple numeric check
2. class Board
	- [[x,x,x,x,x,x], [x,x,x,x,x,x], [x,x,x,x,x,x], [x,x,x,x,x,x], [x,x,x,x,x,x], [x,x,x,x,x,x]]
	- def check_win?
		- horizontal wins
		- vertical wins
		- diagonal wins
	- def check_move?
		- if col is filled
3. class Display
	- [[]]

check_win? logic
5  5  5  5  5  5
4  4  4  4  4  4
3  3  3  3  3  3
2  2  2  2  2  2
1  1  1  1  1  1
0  0  0  0  0  0
c0 c1 c2 c3 c4 c5

horiz
0.upto(5).times do |ypos]
  0.upto(2).times do |ctr|
    if board[0 + ctr][y] == board[1 + ctr][y] == board[2 + ctr][y] == board[3 + ctr][y]

vertical

/
0.upto(2).times do |xpos|
  0.upto(2).times do |ypos|
    if board[ypos][xpos] == board[1 + ypos][1 + xpos] == board[2 + ypos][2 + xpos] == board[3+ypos][3+xpos]
0 0
  board[0][0] board [1][1] board [2][2] board[3][3]
0 1
  board[1][0] board [2][1] board [3][2] board[4][3]
0 2
  board[2][0] board [3][1] board [4][2] board[5][3]
2 2
  board[2][3] board [3][4] board [4][5] board[5][6]

\
6.downto(3).times do |xpos|
  0.upto(3).times do |ypos|
    if board[ypos][xpos] == board[ypos - 1][1 + xpos] == board[ypos - 2][2 + xpos] == board[ypos - 3][3+xpos]

=end