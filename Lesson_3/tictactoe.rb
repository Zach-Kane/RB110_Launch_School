INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def joinor(brd, com=", ", word='or')
  empty_squares = empty_squares(brd)
  last_square = empty_squares.pop
  return last_square if empty_squares.empty?
  "#{empty_squares.join(com)} #{word} #{last_square}"
end

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(brd)
  system 'clear'
  puts "You are #{PLAYER_MARKER} / Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end

def initalize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def who_first?
  first = ''
  loop do
    puts "Who goes first, player or computer?"
    first = gets.chomp
    break if first == 'player' || first == 'computer'
    puts "Not a valid choice"
  end
  first
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt "Choose a square #{joinor(brd)}"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def computer_offense_defense(brd, marker1, marker2)
  move = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker1) == 2 &&
       brd.values_at(*line).count(marker2) == 0
      moves = brd.select { |_, v| v == marker1 }.keys
      move = line.reject { |num| moves.any?(num) }[0]
    end
  end
  move
end

def computer_places_piece!(brd)
  offense = computer_offense_defense(brd, COMPUTER_MARKER, PLAYER_MARKER)
  defense = computer_offense_defense(brd, PLAYER_MARKER, COMPUTER_MARKER)
  random = empty_squares(brd).sample
  return brd[offense] = COMPUTER_MARKER if offense
  return brd[defense] = COMPUTER_MARKER if defense
  return brd[5] = COMPUTER_MARKER if brd[5] == INITIAL_MARKER
  brd[random] = COMPUTER_MARKER
end

def place_piece!(board, current_player)
  case current_player
  when 'player'
    player_places_piece!(board)
  when 'computer'
    computer_places_piece!(board)
  end
end

def alternate_player(current_player)
  case current_player
  when 'player'
    'computer'
  else
    'player'
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

loop do
  board = initalize_board
  current_player = who_first?

  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
  else
    prompt "It's a tie!"
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
