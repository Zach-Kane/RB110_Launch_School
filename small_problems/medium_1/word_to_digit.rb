require 'pry'

require 'pry-byebug'

def word_to_digit(words)
  binding.pry
  words.gsub!('one', '1')
  words.gsub!('two', '2')
  words.gsub!('three', '3')
  words.gsub!('four', '4')
  words.gsub!('five', '5')
  words
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
