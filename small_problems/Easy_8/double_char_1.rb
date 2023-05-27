def repeater(string)
  double = string.chars.map do |char|
    char + char
  end
  double.join
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''