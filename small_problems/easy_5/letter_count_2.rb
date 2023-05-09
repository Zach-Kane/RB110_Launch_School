
def word_sizes(word)
  sizes = Hash.new(0)
  word = word.split
  word.each do |w|
    w.delete!('^a-zA-Z')
    sizes[w.size] += 1
  end
  sizes
end




p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}





# Modify the word_sizes method from the previous exercise to exclude non-letters when determining word size. For instance, the length of "it's" is 3, not 4.

# P: Modify previous method. 
# Exclude non-letters when dtermining word size.

# A: remove non letter elements 
