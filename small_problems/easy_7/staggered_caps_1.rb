def staggered_case(string)
  string = string.chars
  counter = 1
  string.each do |char|
    if counter.odd?
      char.upcase!
    else
      char.downcase!
    end
    counter += 1
  end
  string.join
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'