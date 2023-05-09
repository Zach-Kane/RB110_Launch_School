# def crunch(string)
#   string = string.chars
#   count = 0
#   loop do
#     if string[count] == string[count + 1]
#       string.delete_at(count)
#       next
#     else
#       count += 1
#     end
#     break if count == string.size
#   end
#   string.join
# end

def crunch(text)
  word = ''
  mem = ''
  text.each_char do |char|
  word << char if char != mem
  mem = char
  end
  word
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''


# Write a method that takes a string argument and returns a new string that contains the value of the original string with all consecutive duplicate characters collapsed into a single character. You may not use String#squeeze or String#squeeze!.

# P: Input: string of letters and numbers and an empty string.
# Output: NEW string which contains the value of the orignial with all consecutive duplicate characters collapsed to single character. May NOT use #squeeze 
# E: 
# D: ARRAY
# A: compare curent with next delete next
# use a loop