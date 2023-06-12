def neutralize(sentence)
  words = sentence.split(' ')
  words.map! do |word|
    if negative?(word)
      nil
    else
      word
    end
  end
  p words
  words.compact!.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.