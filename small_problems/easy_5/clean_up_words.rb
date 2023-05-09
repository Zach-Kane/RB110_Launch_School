# Launch School

def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end


# def cleanup(word)
#   word = word.split('')
#   word.map! do |letter|
#     if ('a'..'z').any?(letter)
#       letter
#     else
#       ' '
#     end
#   end
#   count = 0 
#   loop do
#     if word[count] == word[count + 1]
#       word.delete_at(count + 1)
#       next
#     else
#       count += 1
#     end
#     break if count == word.size
#   end
# word.join
# end

p cleanup("---what's my +*& line?") == ' what s my line '


# Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters, write a method that returns that string with all of the non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

# P:
# Input: all lowercase letter characters and non-alpha numeric characters.
# Relace all non alpha_numeric characters with spaces.
# No more than one space a row.

# D: Array

# A: map
# HOw to get rid of more than one space?