def staggered_case(string)
  letters = [*'a'..'z'] + [*'A'..'Z']
  string = string.chars
  counter = 1
  string.each do |char|
    if counter.odd?
      char.upcase!
    else
      char.downcase!
    end
    counter += 1 if letters.any?(char)
  end
  string.join
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'