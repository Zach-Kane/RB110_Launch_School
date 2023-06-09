require 'yaml'

MSG = YAML.load_file('twenty_one.yml')

SUITS = ['♠', '♥', '♦', '♣']
KEYS = { 'J' => 10, 'Q' => 10, 'K' => 10, 'A' => 11 }
VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A']

def prompt(message)
  puts "=> #{MSG[message]}"
end

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

def make_a_card(card)
  space = ' '
  space = '' if card[1] == 10
  ["_______ ",
   "|#{card[1]}#{space}   | ",
   "|     | ",
   "|  #{card[0]}  | ",
   "|     | ",
   "|   #{card[1]}#{space}| ",
   "------- "]
end

def make_all_cards(player)
  cards = ['', '', '', '', '', '', '']

  player.each do |card|
    index = 0
    make_a_card(card).each do |line|
      cards[index] << line
      index += 1
    end
  end
  cards
end

def print_cards(player_cards, name, default_total='')
  puts make_all_cards(player_cards)
  puts "#{name} hand: #{default_total}"
end

def print_all(human, computer, human_total, computer_total)
  print_cards(computer, 'Dealer', computer_total)
  print_cards(human, 'Your', human_total)
end

def end_round(human, computer, human_total, computer_total, score)
  system 'clear'
  show_score(score)
  if bust?(human_total)
    prompt('you bust')
  elsif bust?(computer_total)
    prompt('dealer bust')
  elsif computer_total > human_total
    prompt('dealer win')
  elsif human_total > computer_total
    prompt('you win')
  else
    prompt('draw')
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
  puts "=> Your Score: #{score[:player]}, Dealer Score: #{score[:computer]}"
end

def display_rules
  system 'clear'
  prompt('welcome')
  sleep(1)
  prompt('rules')
  sleep(1)
end

def prompt_get_rounds
  loop do
    prompt('rounds')
    rounds = gets.chomp
    return rounds if rounds.to_i.to_s == rounds && rounds.to_i > 0
    prompt('not valid')
    sleep(1.5)
  end
end

def deal_initial_cards(deck, human, computer)
  deal_card(deck, human, 2)
  deal_card(deck, computer, 2)

  system 'clear'
  prompt('deal1')
  sleep(0.5)
  system 'clear'
  prompt('deal2')
  sleep(0.5)
end

def main_game_display(human, computer, human_total, score, rounds)
  system 'clear'
  puts "=> First player to win #{rounds} rounds wins the game."

  show_score(score)

  show_computer_hand(computer)

  print_cards(human, 'Your', human_total)
end

loop do
  display_rules
  rounds = prompt_get_rounds
  rounds = rounds.to_i

  score = { computer: 0, player: 0 }

  loop do
    deck = []
    human = []
    computer = []
    converted_hand = nil
    human_total = nil
    deck = initialize_deck(deck)

    deal_initial_cards(deck, human, computer)

    loop do
      converted_hand = convert_hand(human)
      human_total = hand_total(converted_hand)

      main_game_display(human, computer, human_total, score, rounds)

      if bust?(human_total)
        break
      end

      prompt('hit/stay')
      answer = gets.chomp.to_i
      if answer == 1
        deal_card(deck, human, 1)
        next
      elsif answer == 2
        break
      else
        prompt('not valid')
        sleep(1)
        next
      end
    end

    hit_computer(deck, computer) if !bust?(human_total)

    computer_total = hand_total(convert_hand(computer))

    score(human_total, computer_total, score)

    end_round(human, computer, human_total, computer_total, score)

    prompt('continue')
    gets.chomp

    break if score[:player] == rounds || score[:computer] == rounds
  end

  if score[:player] == rounds
    prompt('you win game')
  else
    prompt('dealer win game')
  end

  prompt('play again?')
  answer = gets.chomp.to_i
  unless answer == 1
    prompt('thanks for playing')
    break
  end
end
