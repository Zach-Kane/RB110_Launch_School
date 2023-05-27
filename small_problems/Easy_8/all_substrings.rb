def leading_substrings(string)
  count = 1 
  string_array = []
  string.length.times do
    string_array << string.slice(0, count)
    count += 1
  end
  string_array
end

def substrings(string)
  substrings = []
  string.size.times do
    substrings << leading_substrings(string)
    string.slice!(0)
  end
substrings.flatten
end

p substrings('abcde') #== [
#   'a', 'ab', 'abc', 'abcd', 'abcde',
#   'b', 'bc', 'bcd', 'bcde',
#   'c', 'cd', 'cde',
#   'd', 'de',
#   'e'
# ]