def balanced?(string)
  parentheses = string.chars.select {|char| char =~ /[()]/ }
  p parentheses
  loop do
    if !(parentheses.shift == '(' && parentheses.pop == ')')
      return false
    end
    return true if parentheses.empty?
  end
end

 p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false