def leading_substrings(string)
  count = 1 
  string_array = []
  string.length.times do
    string_array << string.slice(0, count)
    count += 1
  end
  string_array
end

p leading_substrings('abc') #== ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']