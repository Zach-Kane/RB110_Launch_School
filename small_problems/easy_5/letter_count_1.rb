def word_sizes(word)
  sizes = Hash.new(0)
  word = word.split
  word.each do |w|
    sizes[w.size] += 1
  end
  sizes
end


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}


# Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.

# Words consist of any string of characters that do not include a space.

#   P: 
#   Input: string with one or more space separated words.
#   Output: Hash with the count of word.size

#   D: Array for word
#   Adding to an empty hash

#   A: HASH << word.count