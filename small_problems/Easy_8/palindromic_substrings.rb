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



def palindromes(string)
  string = substrings(string)
  string.select do |sub|
    sub == sub.reverse if sub.length > 1
  end
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
   'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt']