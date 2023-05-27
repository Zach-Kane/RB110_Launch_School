def reverse_words(string)
  string = string.split.map do |word|
    if word.size > 4
      word.reverse
    else
      word
    end
  end
  string.join(' ')
end

puts reverse_words('Professional')           == 'lanoisseforP'
p reverse_words('Walk around the block')  == 'Walk dnuora the kcolb'
puts reverse_words('Launch School')          == 'hcnuaL loohcS'