def swapcase(string)
  string = string.chars.map! do |char|
    if [*'A'..'Z'].any?(char)
      char.downcase
    elsif
      [*'a'..'z'].any?(char)
      char.upcase
    else
      char
    end
  end
    string.join('')
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'