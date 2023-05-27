def group_anagrams(words)
  word_list = []
  sorted = words.map do |word|
    word.chars.sort.join
  end
  key = sorted.uniq
  key.each do |k|
    sub_list = []
    words.each do |w|
      sub_list << w if w.chars.sort.join == k
    end
    word_list << sub_list
  end
  word_list.each { |ea| p ea }
end

words = ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

group_anagrams(words)



## LS Version
# result = {}

# words.each do |word|
#   key = word.split('').sort.join
#   puts key
#   if result.has_key?(key)
#     result[key].push(word)
#   else
#     result[key] = [word]
#   end
# end
# puts result
# result.each_value do |v|
#   puts "------"
#   p v
# end