def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

# code your input_to_index and move method here!
def input_to_index(user_input)
  return user_input.to_i() - 1
end

# Enters the specified <player> into the specified position on the board.
#
# @param <board> - game array
# @param <move_position> - index of next move, should be in range 0-8
# @param <player> - string with value "X" or "O"
def move(board, move_position, player="X")
  board[move_position] = player
  
  return board
end

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Row wins
  [3, 4, 5], 
  [6, 7, 8], 
  [0, 3, 6], # Column wins
  [1, 4, 7], 
  [2, 5, 8], 
  [0, 4, 8], # Diagonal wins 
  [2, 4, 6] 
]

def won?(board)
  WIN_COMBINATIONS.each do |winc|
    if (board[winc[0]].eql?("X") && board[winc[1]].eql?("X") && board[winc[2]].eql?("X")) || (board[winc[0]].eql?("O") && board[winc[1]].eql?("O") && board[winc[2]].eql?("O"))
      return winc
    end
  end
  return false
end 

def full?(board)
  board.all? do |position|
    !(position.nil? || position == " ")
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  win_combo = won?(board)
  
  win_combo ? board[win_combo[0]] : nil
end