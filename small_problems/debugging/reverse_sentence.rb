def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []
  p words.size
  i = 0
  while i < words.size
    reversed_words << words.pop
    #i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'