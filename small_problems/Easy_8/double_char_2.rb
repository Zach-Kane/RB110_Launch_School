def repeater(string, letters)
  double = string.chars.map do |char|
    if letters.any?(char)
      char + char
    else
      char
    end
  end
  double.join
end

def double_consonants(string)
  letters = ('a'..'z').to_a + ('A'..'Z').to_a
  letters.reject! { |char| char =~ /[AEIOUaeiou]/ }
  repeater(string, letters)
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
