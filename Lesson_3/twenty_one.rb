SUITS = ['♠', '♥', '♦', '♣']
KEYS = { 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

def initialize_deck(deck)
  SUITS.each do |suits|
    VALUES.each do |value|
      deck << [suits, value]
    end
  end
  deck
end

def deal_card(deck, player, times)
  times.times do
    sample = deck.sample
    player << sample
    deck.delete(sample)
  end
end

def card_convert(player)
  player.map do |card|
    card.map do |num|
      if KEYS.keys.any?(num)
        KEYS[num]
      else
        num
      end
    end
  end
end

def convert_hand(player)
  converted_hand = card_convert(player)
  before_aces = hand_total(converted_hand)
  calculate_aces(player, before_aces, converted_hand)
  converted_hand
end

def hand_total(converted_hand)
  hand_total = 0
  converted_hand.each do |hand|
    hand_total += hand[1]
  end
  hand_total
end

def calculate_aces(player, before_aces, converted_hand)
  index = 0
  player.each do |card|
    if card.any?('A') && before_aces > 21
      converted_hand[index][1] = 1
    end
    before_aces = hand_total(converted_hand)
    index += 1
  end
end

def show_computer_hand(computer)
  computer_hand = []
  computer_hand << computer[0]
  computer_hand << ['?', '?']
  print_cards(computer_hand, 'Dealers')
end

def hit_computer(deck, computer)
  loop do
    computer_total = hand_total(convert_hand(computer))
    if computer_total < 17
      deal_card(deck, computer, 1)
    else
      break
    end
    break if bust?(computer_total)
  end
end

def bust?(hand_total)
  if hand_total > 21
    true
  end
end

def print_cards(player, name='Player', default_total='')
  line1 = ''
  line2 = ''
  line3 = ''
  line4 = ''
  line5 = ''
  line6 = ''
  line7 = ''

  player.each do |card|
    space = ' '
    space = '' if card[1] == 10

    line1 << "_______ "
    line2 << "|#{card[1]}#{space}   | "
    line3 << "|     | "
    line4 << "|  #{card[0]}  | "
    line5 << "|     | "
    line6 << "|   #{card[1]}#{space}| "
    line7 << "------- "
  end

  puts line1
  puts line2
  puts line3
  puts line4
  puts line5
  puts line6
  puts line7
  puts "#{name} hand: #{default_total}"
end

def print_all(human, computer, human_total, computer_total)
  print_cards(computer, 'Dealer', computer_total)
  print_cards(human, 'Your', human_total)
end

def end_game(human, computer, human_total, computer_total, score)
  system 'clear'
  show_score(score)
  if bust?(human_total)
    puts "You Bust, Dealer Wins!!!!"
  elsif bust?(computer_total)
    puts "Dealer busts, You win!!!!"
  elsif computer_total > human_total
    puts "Dealer Wins!!"
  elsif human_total > computer_total
    puts "You Win!!!"
  else
    puts "It's a draw!!"
  end

  print_all(human, computer, human_total, computer_total)
end

def score(human_total, computer_total, score)
  if bust?(human_total)
    score[:computer] += 1
  elsif bust?(computer_total)
    score[:player] += 1
  elsif computer_total > human_total
    score[:computer] += 1
  elsif human_total > computer_total
    score[:player] += 1
  end
end

def show_score(score)
  puts "Your Score: #{score[:player]}, Dealer Score: #{score[:computer]}"
end

loop do
  system 'clear'
  puts "Welcome to Lets Play 21!"
  sleep(1)
  puts "The player to get closest to 21 without going over wins"
  sleep(1)
  puts "How many rounds should we play? Enter any number"
  rounds = gets.chomp.to_i

  score = { computer: 0, player: 0 }

  loop do
    deck = []
    human = []
    computer = []
    converted_hand = nil
    human_total = nil
    deck = initialize_deck(deck)

    deal_card(deck, human, 2)
    deal_card(deck, computer, 2)

    system 'clear'
    puts 'Dealing cards.'
    sleep(0.5)
    system 'clear'
    puts 'Dealing cards..'
    sleep(0.5)
    loop do
      system 'clear'
      puts "First player to #{rounds} wins the game."
      show_score(score)
      converted_hand = convert_hand(human)
      show_computer_hand(computer)
      human_total = hand_total(converted_hand)
      print_cards(human, 'Your', human_total)
      if bust?(human_total)
        break
      end
      puts "Would you like to 1) Hit, 2) Stay"
      answer = gets.chomp.to_i
      if answer == 1
        deal_card(deck, human, 1)
        next
      elsif answer == 2
        break
      else
        puts "Not a valid choice"
        sleep(1)
        next
      end
    end

    hit_computer(deck, computer) if !bust?(human_total)

    computer_total = hand_total(convert_hand(computer))

    score(human_total, computer_total, score)

    end_game(human, computer, human_total, computer_total, score)

    puts "Hit any button to continue"
    gets.chomp

    break if score[:player] == rounds || score[:computer] == rounds
  end
  if score[:player] == rounds
    puts "You win the game!!"
  else
    puts "Dealer won this game!!"
  end
  puts "Would you like you play again? 1) Yes, 2) No"
  answer = gets.chomp.to_i
  break unless answer == 1
end
