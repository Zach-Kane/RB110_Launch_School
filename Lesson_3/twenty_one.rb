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

def convert_hand(player)
  converted_hand = card_convert(player)
  before_aces = hand_total(converted_hand)
  calculate_aces(player, before_aces, converted_hand)
  converted_hand
end

def computer_hand(computer)
  computer_hand = []
  computer_hand << computer[0]
  computer_hand << ['?', '?']
  print_cards(computer_hand, 'Dealers')
end

def hit_computer(deck, computer)
  loop do
    if hand_total(convert_hand(computer)) < 17
      deal_card(deck, computer, 1)
    else
      break
    end
    break if bust?(computer)
  end
end

def bust?(player)
  if hand_total(convert_hand(player)) > 21
    true
  end
end

def print_cards(player, name='default')
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
  puts "#{name} hand"
end

def print_all(human, computer, human_hand, computer_hand)
  print_cards(computer, 'Dealer')
  puts "Total: #{computer_hand}"
  print_cards(human, 'Your')
  puts "Total: #{human_hand}"
end

def end_game(human, computer)
  computer_hand = hand_total(convert_hand(computer))
  human_hand = hand_total(convert_hand(human))
  system 'clear'
  if bust?(human)
    puts "You Bust, Dealer Wins!!!!"
  elsif bust?(computer)
    puts "Dealer busts, You win!!!!"
  elsif computer_hand > human_hand
    puts "Dealer Wins!!"
  elsif human_hand > computer_hand
    puts "You Win!!!"
  else
    puts "It's a draw!!"
  end

  print_all(human, computer, human_hand, computer_hand)
end

loop do
  deck = []
  human = []
  computer = []

  deck = initialize_deck(deck)

  deal_card(deck, human, 2)
  deal_card(deck, computer, 2)

  loop do
    system 'clear'
    converted_hand = convert_hand(human)
    computer_hand(computer)
    print_cards(human, 'Your')
    p hand_total(converted_hand)
    if bust?(human)
      break
    end
    puts "Would you like to 1) hit 2) stay"
    answer = gets.chomp.downcase
    if answer.start_with?('1')
      deal_card(deck, human, 1)
      next
    end
    break
  end

  if hand_total(convert_hand(human)) <= 21
    hit_computer(deck, computer)
  end

  end_game(human, computer)

  puts "Would you like you play again? yes/no"
  answer = gets.chomp.downcase
  break unless answer.start_with?('y')
end
