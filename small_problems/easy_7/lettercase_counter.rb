def letter_case_count(letters)
count = { uppercase: 0, lowercase: 0, neither: 0 }
letters = letters.chars

letters.each do |letter|
  count[:lowercase] += 1 if ('a'..'z').any?(letter)
  count[:uppercase] += 1 if ('A'..'Z').any?(letter)
  count[:neither] += 1 if letter.count('^A-Za-z') == 1
end
count
end



p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }